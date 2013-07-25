default[:project_workspace][:user] = "vagrant"
default[:project_workspace][:group] = "vagrant"
default[:project_workspace][:dir] = "/home/vagrant"

override[:vslinko][:user] = default[:project_workspace][:user]
override[:vslinko][:group] = default[:project_workspace][:group]
override[:vslinko][:home] = default[:project_workspace][:dir]
