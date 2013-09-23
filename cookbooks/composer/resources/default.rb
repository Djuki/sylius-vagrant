actions :install, :remove, :update

default_action :install

attribute :target_dir, :kind_of => String, :name_attribute => true
attribute :global_bin_dir, :kind_of => String, :default => "/usr/local/bin"
attribute :global, :equal_to => [true, false], :default => true
attribute :owner, :kind_of => [String, Integer], :default => "root"
attribute :group, :kind_of => [String, Integer], :default => "admin"
attribute :source, :kind_of => [String], :default => "https://getcomposer.org/composer.phar"
