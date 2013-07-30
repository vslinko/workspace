include_recipe "project_workspace"
include_recipe "nodejs"
include_recipe "mongodb"

execute "npm install -g coffee-script"

project_workspace "polartour" do
  repository "git@github.com:rithis/polartour.git"
end

execute "npm install" do
  cwd "#{node[:project_workspace][:dir]}/polartour"
  user node[:project_workspace][:user]
  group node[:project_workspace][:group]
  env "HOME" => node[:project_workspace][:dir]
end

template "/etc/init/polartour.conf"

link "/etc/init.d/polartour" do
  to "/lib/init/upstart-job"
end

service "polartour" do
  provider Chef::Provider::Service::Upstart
  supports :restart => true, :start => true, :stop => true
  action [:enable, :start]
end

