actions :create, :enable, :restart, :start
default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :install_path, :kind_of => String, :required => true
attribute :log_file, :kind_of => String, :required => true
attribute :pid_file, :kind_of => String, :required => true

# defaults to "cloudfoundry-#{name}"
attribute :component_name, :kind_of => [String, NilClass], :default => nil
attribute :config_file, :kind_of => [String, NilClass], :default => nil
attribute :user, :kind_of => [String, NilClass], :default => nil
attribute :group, :kind_of => [String, NilClass], :default => nil
attribute :bin_file, :kind_of => [String, NilClass], :default => nil
attribute :binary, :kind_of => [String, NilClass], :default => nil
attribute :upstart_file, :kind_of => [String, NilClass], :default => nil
attribute :upstart_file_cookbook, :kind_of => [String, NilClass], :default => nil
attribute :extra_args, :kind_of => [String, NilClass], :default => nil

# internal
attribute :ruby_version, :kind_of => [String, NilClass], :default => nil
attribute :ruby_path, :kind_of => [String, NilClass], :default => nil
attribute :service_resource
