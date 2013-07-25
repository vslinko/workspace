dmg_package "Dropbox" do
  source node[:my_computer][:dropbox][:url]
  volumes_dir "Dropbox Installer"
end

%w{ id_rsa id_rsa.pub }.each do |file|
  if File.exists?("#{node[:my_computer][:home]}/Dropbox/ssh/#{file}")
    file "#{node[:my_computer][:home]}/.ssh/#{file}" do
      content File.read("#{node[:my_computer][:home]}/Dropbox/ssh/#{file}")
      owner node[:my_computer][:user]
      group node[:my_computer][:group]
      mode "0600"
    end
  end
end
