actions :install, :update, :create_project, :create, :dump_autoload

default_action :install

attribute :install_path, :kind_of => [String, NilClass], :name_attribute => true, :default => "/opt/composer-libraries"
attribute :user, :kind_of => [String, Integer], :default => "root"
attribute :group, :kind_of => [String, Integer], :default => "admin"
attribute :prefer_source, :kind_of => [String, NilClass]
attribute :prefer_dist, :kind_of => [String, NilClass]
attribute :dev, :equal_to => [true, false], :default => false
attribute :optimize_autoloader, :equal_to => [true, false], :default => false
attribute :no_scripts, :equal_to => [true, false], :default => false
attribute :verbose, :equal_to => [true, false], :default => false
attribute :optimize, :equal_to => [true, false], :default => false
attribute :keep_vcs, :equal_to => [true, false], :default => false
attribute :stability, :kind_of => String, :default => "stable"
attribute :repository_url, :kind_of => [String, NilClass]
attribute :bin_dir, :kind_of => [String, NilClass], :default => "/usr/local/bin"
attribute :config, :kind_of => Hash, :default => {}
attribute :scripts, :kind_of => Hash, :default => {}
attribute :packages, :kind_of => Hash, :default => {}
