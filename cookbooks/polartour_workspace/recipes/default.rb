include_recipe "project_workspace"
include_recipe "nodejs"
include_recipe "mongodb"

project_workspace "polartour" do
  repository "git@github.com:rithis/polartour.git"
end

execute "npm install" do
  cwd "#{node[:project_workspace][:dir]}/polartour"
  user node[:project_workspace][:user]
  group node[:project_workspace][:group]
  env "HOME" => node[:project_workspace][:dir]
end

