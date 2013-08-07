include_recipe "project_workspace"
include_recipe "nodejs"

node[:nodejs_workspace][:global_modules].each do |m|
  execute "npm install -g #{m}"
end

project_name = node[:nodejs_workspace][:project][:name]
project_dir = "#{node[:project_workspace][:dir]}/#{project_name}"
node.set[:nodejs_workspace][:project][:dir] = project_dir

if node[:nodejs_workspace][:project][:git]
  project_workspace project_name do
    repository node[:nodejs_workspace][:project][:git]
  end
else
  directory project_dir do
    owner node[:project_workspace][:user]
    group node[:project_workspace][:group]
  end
end

if node[:nodejs_workspace][:project][:install_modules]
  execute "npm install" do
    cwd project_dir
    user node[:project_workspace][:user]
    group node[:project_workspace][:group]
    env "HOME" => node[:project_workspace][:dir]
  end
end

if node[:nodejs_workspace][:project][:daemon_command]
  template "/etc/init/#{project_name}.conf" do
    source "nodejs_project.conf.erb"
  end

  link "/etc/init.d/#{project_name}" do
    to "/lib/init/upstart-job"
  end

  service project_name do
    provider Chef::Provider::Service::Upstart
    supports :restart => true, :start => true, :stop => true
    action [:enable, :start]
  end
end
