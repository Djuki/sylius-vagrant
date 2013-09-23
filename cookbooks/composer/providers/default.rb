action :install do
	Chef::Log.info("Deploy composer to: #{new_resource.target_dir}")

	directory new_resource.target_dir do
		owner new_resource.owner
		group new_resource.group
		mode 0755
		recursive true
	end

	remote_file "#{new_resource.target_dir}/composer.phar" do 
		source new_resource.source
		owner new_resource.owner
		group new_resource.group
		mode 0755

		action :create_if_missing
	end

	link "#{new_resource.global_bin_dir}/composer" do
		to "#{new_resource.target_dir}/composer.phar"

		only_if {new_resource.global}
	end

	new_resource.updated_by_last_action(true)
end

action :update do
	Chef::Log.info("Upgrade composer in location: #{new_resource.target_dir}")

	script "upgrade composer" do
		interpreter "php"
		command "composer self-update --no-ansi --quiet --no-interaction"
	end

	new_resource.updated_by_last_action(true)
end

#TODO: why is remove not working?
action :remove do
	Chef::Log.info("Uninstall composer from location: #{new_resource.target_dir}")

	directory new_resource.target_dir do
		recursive true
		action :remove
	end

	link "#{new_resource.global_bin_dir}/composer" do
		action :delete
		only_if "test -f #{new_resource.global_bin_dir}/composer"
	end
end
