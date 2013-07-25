include_recipe "project_workspace"
include_recipe "nodejs"

execute "npm install -g grunt-cli" do
  not_if do
    File.exists?("/usr/local/bin/grunt")
  end
end

projects = %w{ symfio symfio-suite } + node[:symfio_workspace][:plugins]

projects.each do |project|
  project_workspace project do
    repository "git@github.com:symfio/#{project}.git"
  end

  execute "npm install" do
    cwd "#{node[:project_workspace][:dir]}/#{project}"
    user node[:project_workspace][:user]
    group node[:project_workspace][:group]
    env "HOME" => node[:project_workspace][:dir]
  end
end
