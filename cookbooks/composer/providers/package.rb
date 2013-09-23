action :install do
	Chef::Log.info("Install package in directory: #{new_resource.install_path}")
  arguments = initialize_arguments(new_resource)

	execute "install-composer-packages" do
		user new_resource.user
		group new_resource.group
		cwd new_resource.install_path
		command "composer install #{arguments}"
		
		only_if "composer help"
	end

	new_resource.updated_by_last_action(true)
end

action :update do
	Chef::Log.info("Update package: #{new_resource.name}")
  arguments = initialize_arguments(new_resource)
	
	execute "update-composer-packages" do
		user new_resource.user
		group new_resource.group
		cwd new_resource.install_path
		command "composer update #{arguments}"
		
		only_if "composer help"
	end

	new_resource.updated_by_last_action(true)
end

action :create_project do
	arguments = "--no-interaction --no-ansi --stability #{new_resource.stability}"
	Chef::Log.info("Composer create-project: #{new_resource.name}")
	
	if new_resource.dev
		arguments += " --dev"
	end
	if new_resource.prefer_source
		arguments += " --prefer-source"
	end
	if new_resource.prefer_dist
		arguments += " --prefer-dist"
	end
	if new_resource.keep_vcs
		arguments += " --keep-vcs"
	end
	if new_resource.no_scripts
		arguments += " --no-scripts"
	end
	if new_resource.repository_url
		arguments += " --repository-url #{new_resource.repository_url}"
	end

	execute "composer create-project" do
		command "composer create-project #{arguments} #{new_resource.name} #{new_resource.install_path}"
		not_if "test -d #{new_resource.install_path}"
	end

	new_resource.updated_by_last_action(true)
end

action :create do
  Chef::Log.info("Composer create \"composer.json\" file in path: " + new_resource.install_path)

  directory new_resource.install_path do
    owner "root"
    group "root"
    mode 0755
    recursive true
    action :create

    not_if "test -d #{new_resource.install_path}"
  end

  template "composer.json.erb" do
    source "composer.json.erb"
    cookbook "composer"
    path "#{new_resource.install_path}/composer.json"
    mode 0644
    variables(
        :packages => new_resource.packages,
        :config => new_resource.config,
        :scripts => new_resource.scripts,
        :stability => new_resource.stability
    )
  end

  new_resource.updated_by_last_action(true)
end

action :dump_autoload do
  arguments = "--no-interaction --no-ansi -q"

  if new_resource.optimize
    arguments += " --optimize"
  end

  execute "composer create-project" do
    command "composer dump-autoload #{arguments}"
    cwd new_resource.install_path

    not_if "test -d #{new_resource.install_path}"
  end

  new_resource.updated_by_last_action(true)
end

def initialize_arguments(new_resource)
  arguments = "--no-interaction --no-ansi -q"

  if new_resource.verbose
    arguments = " --no-interaction --verbose"
  end
  if new_resource.dev
    arguments += " --dev"
  else
    arguments += " --no-dev"
  end
  if new_resource.prefer_source
    arguments += " --prefer-source"
  end
  if new_resource.prefer_dist
    arguments += " --prefer-dist"
  end
  if new_resource.optimize_autoloader
    arguments += " --optimize-autoloader"
  end
  if new_resource.no_scripts
    arguments += " --no-scripts"
  end
  arguments
end
