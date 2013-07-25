action :create do
  execute "git clone #{new_resource.repository} #{node[:project_workspace][:dir]}/#{new_resource.name}" do
    user node[:project_workspace][:user]
    group node[:project_workspace][:group]
    not_if do
      ::File.exists?("#{node[:project_workspace][:dir]}/#{new_resource.name}")
    end
  end
end
