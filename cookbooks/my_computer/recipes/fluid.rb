remote_file "#{Chef::Config[:file_cache_path]}/Fluid.zip" do
  source node[:my_computer][:fluid][:url]
end

execute "unzip #{Chef::Config[:file_cache_path]}/Fluid.zip" do
  cwd "/Applications"
  not_if do
    File.exists?("/Applications/Fluid.app")
  end
end
