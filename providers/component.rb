include Chef::Mixin::CloudfoundryCommon
include Chef::Mixin::LanguageIncludeRecipe

def initialize(name, run_context=nil)
  super

  # internal
  new_resource.ruby_version(node['cloudfoundry']['ruby_1_9_2_version']) unless new_resource.ruby_version
  new_resource.ruby_path(ruby_bin_path(new_resource.ruby_version)) unless new_resource.ruby_path

  new_resource.component_name("cloudfoundry-#{new_resource.name}") unless new_resource.component_name
  new_resource.config_file(::File.join(node['cloudfoundry']['config_dir'], "#{new_resource.name}.yml")) unless new_resource.config_file
  new_resource.user(node['cloudfoundry']['user']) unless new_resource.user
  new_resource.bin_file(::File.join(new_resource.install_path, "bin", new_resource.name)) unless new_resource.bin_file
  new_resource.binary("#{::File.join(new_resource.ruby_path, "ruby")} #{new_resource.bin_file}")
  new_resource.upstart_file("upstart.conf.erb") unless new_resource.upstart_file
  new_resource.upstart_file_cookbook("cloudfoundry") unless new_resource.upstart_file_cookbook

  service_resource = service new_resource.component_name do
    supports :status => true, :restart => true
    action :nothing
  end
  new_resource.service_resource(service_resource)
end

action :create do
  include_recipe "logrotate"

  cfg_updated = create_config_file
  svc_updated = create_service

  create_logrotate_config

  if new_resource.updated_by_last_action(cfg_updated || svc_updated)
    new_resource.notifies(:restart, new_resource.service_resource)
  end
end

action :enable do
  new_resource.service_resource.run_action(:enable)
  new_resource.updated_by_last_action(new_resource.service_resource.updated_by_last_action?)
end

action :restart do
  new_resource.service_resource.run_action(:restart)
  new_resource.updated_by_last_action(new_resource.service_resource.updated_by_last_action?)
end

action :start do
  new_resource.service_resource.run_action(:start)
  new_resource.updated_by_last_action(new_resource.service_resource.updated_by_last_action?)
end

protected

def create_config_file
  directory node['cloudfoundry']['config_dir'] do
    owner "root"
    group 0
    recursive true
    action :nothing
  end.run_action(:create)

  t1 = template new_resource.config_file do
    source   "#{new_resource.name}-config.yml.erb"
    owner    new_resource.user
    mode     "0644"
    action :nothing
  end
  t1.run_action(:create)

  t1.updated_by_last_action?
end

def create_service
  t = template "/etc/init/#{new_resource.component_name}.conf" do
    cookbook new_resource.upstart_file_cookbook
    source   new_resource.upstart_file
    mode     0644
    variables(
      :component_name => new_resource.component_name,
      :path        => new_resource.ruby_path,
      :bin_file    => new_resource.bin_file,
      :binary      => new_resource.binary,
      :config_file => new_resource.config_file,
      :pid_file    => new_resource.pid_file,
      :user        => new_resource.user,
      :extra_args  => new_resource.extra_args
    )
    action :nothing
  end
  t.run_action(:create)

  l = link "/etc/init.d/#{new_resource.component_name}" do
    to "/lib/init/upstart-job"
    action :nothing
  end
  l.run_action(:create)

  t.updated_by_last_action? || l.updated_by_last_action?
end

def create_logrotate_config
  log_file = new_resource.log_file
  logrotate_app new_resource.component_name do
    cookbook "logrotate"
    path log_file
    frequency daily
    rotate 30
    create "644 root root"
  end
end
