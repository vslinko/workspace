directory = File.expand_path(File.dirname(__FILE__))

cookbook_path "#{directory}/cookbooks"
data_bag_path "#{directory}/data_bags"
file_cache_path "#{directory}/cache"
file_backup_path "#{directory}/backup"
role_path "#{directory}/roles"
