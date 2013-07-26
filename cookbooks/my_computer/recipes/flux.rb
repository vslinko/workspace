remote_file "#{Chef::Config[:file_cache_path]}/Flux.zip" do
  source node[:my_computer][:flux][:url]
end

execute "unzip #{Chef::Config[:file_cache_path]}/Flux.zip" do
  cwd "/Applications"
  not_if do
    File.exists?("/Applications/Flux.app")
  end
end
