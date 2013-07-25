remote_file "#{Chef::Config[:file_cache_path]}/Alfred.zip" do
  source node[:my_computer][:alfred][:url]
end

execute "unzip #{Chef::Config[:file_cache_path]}/Alfred.zip" do
  cwd "/Applications"
  not_if do
    File.exists?("/Applications/Alfred 2.app")
  end
end
