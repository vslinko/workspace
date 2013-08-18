include_recipe "homebrew"

execute "curl -L https://get.rvm.io | bash -s stable --ruby=1.9" do
  user node[:my_computer][:user]
  group node[:my_computer][:group]
  not_if do
    File.exists?("#{node[:my_computer][:home]}/.rvm")
  end
end

dmg_package "VirtualBox" do
  source "http://download.virtualbox.org/virtualbox/4.2.16/VirtualBox-4.2.16-86992-OSX.dmg"
  type "pkg"
end

dmg_package "Vagrant" do
  source "http://files.vagrantup.com/packages/0219bb87725aac28a97c0e924c310cc97831fd9d/Vagrant-1.2.4.dmg"
  package_id "com.vagrant.vagrant"
  type "pkg"
end

gem_package "chef"
gem_package "berkshelf"
gem_package "librarian-chef"

execute "vagrant plugin install vagrant-berkshelf" do
  user node[:my_computer][:user]
  group node[:my_computer][:group]
  not_if "vagrant plugin list | grep vagrant-berkshelf"
end

%w{ git vim zsh }.each do |package|
  package package
end

git "#{node[:my_computer][:home]}/workspace" do
  repository "https://github.com/vslinko/workspace.git"
  user node[:my_computer][:user]
  group node[:my_computer][:group]
  action :checkout
end

if File.exists?("#{node[:my_computer][:home]}/.ssh/id_rsa")
  execute "git remote add origin git@github.com:vslinko/workspace.git" do
    cwd "#{node[:my_computer][:home]}/workspace"
    user node[:my_computer][:user]
    group node[:my_computer][:group]
    not_if "cd #{node[:my_computer][:home]}/workspace && git remote -v | grep '^origin'"
  end

  execute "git remote set-url origin git@github.com:vslinko/workspace.git" do
    cwd "#{node[:my_computer][:home]}/workspace"
    user node[:my_computer][:user]
    group node[:my_computer][:group]
    not_if "cd #{node[:my_computer][:home]}/workspace && git remote -v | grep '^origin' | grep git@github.com"
  end
end
