node.default['cloudfoundry']['droplets_dir']           = "#{node.default['cloudfoundry']['shared_dir']}/droplets"
node.default['cloudfoundry']['resources_dir']          = "#{node.default['cloudfoundry']['shared_dir']}/resources"
node.default['cloudfoundry']['staging_manifests_dir']  = "#{node.default['cloudfoundry']['shared_dir']}/staging_manifests"

%w[config_dir log_dir pid_dir staging_manifests_dir droplets_dir resources_dir services_dir].each do |d|
  directory node['cloudfoundry'][d] do
    recursive true
    owner node['cloudfoundry']['user']
    mode  '0755'
  end
end
