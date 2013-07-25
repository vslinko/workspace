include_recipe "apt"
include_recipe "git"
include_recipe "vim"
include_recipe "zsh"
include_recipe "vslinko::git"
include_recipe "vslinko::vim"
include_recipe "vslinko::zsh"

user node[:project_workspace][:user] do
  shell "/bin/zsh"
end

file "#{node[:project_workspace][:dir]}/postinstall.sh" do
  action :delete
end

%w{ id_rsa id_rsa.pub }.each do |file|
  cookbook_file "#{node[:project_workspace][:dir]}/.ssh/#{file}" do
    owner node[:project_workspace][:user]
    group node[:project_workspace][:group]
    mode "0600"
  end
end

execute "ssh-keyscan github.com >> #{node[:project_workspace][:dir]}/.ssh/known_hosts" do
  user node[:project_workspace][:user]
  group node[:project_workspace][:group]
  not_if "grep github.com #{node[:project_workspace][:dir]}/.ssh/known_hosts"
end
