

composer node[:composer][:target_dir] do 
	global node[:composer][:global]
	source node[:composer][:source]
	global_bin_dir node[:composer][:global_bin_dir]
	owner node[:composer][:owner]
	group node[:composer][:group]
	action :install
end