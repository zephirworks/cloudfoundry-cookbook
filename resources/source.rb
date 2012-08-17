actions :checkout
default_action :checkout

attribute :name, :kind_of => String, :name_attribute => true
attribute :repository, :kind_of => String, :required => true
attribute :reference, :kind_of => String, :required => true
attribute :path, :kind_of => [String, NilClass], :default => nil
attribute :user, :kind_of => [String, NilClass], :default => nil
attribute :enable_submodules, :kind_of => [TrueClass, FalseClass, NilClass], :default => true
attribute :depth, :kind_of => Integer, :default => 10
attribute :subdirectory, :kind_of => [String, NilClass], :default => nil
attribute :ruby_version, :kind_of => [String, NilClass], :default => nil
attribute :ruby_path, :kind_of => [String, NilClass], :default => nil
