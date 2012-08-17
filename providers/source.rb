include Chef::Mixin::CloudfoundryCommon

def initialize(name, run_context=nil)
  super

  new_resource.path("/srv/vcap-source/#{new_resource.name}") unless new_resource.path
  new_resource.user(node['cloudfoundry']['user']) unless new_resource.user
  new_resource.ruby_version(node['cloudfoundry']['ruby_1_9_2_version']) unless new_resource.ruby_version
  new_resource.ruby_path(ruby_bin_path(new_resource.ruby_version))
end

action :checkout do
  d = directory new_resource.path do
    user new_resource.user
    recursive true
    action :nothing
  end
  d.run_action(:create)

  r = git new_resource.path do
    repository        new_resource.repository
    reference         new_resource.reference
    user              new_resource.user
    enable_submodules new_resource.enable_submodules
    depth             new_resource.depth
    action :nothing
  end
  r.run_action(:sync)

  if r.updated_by_last_action?
    gr = rbenv_gem "bundler" do
      ruby_version new_resource.ruby_version
      action :nothing
    end
    gr.run_action(:install)

    %w[.bundle bundle].each do |d|
      dr = directory ::File.join(new_resource.path, d) do
        user new_resource.user
        action :nothing
      end
      dr.run_action(:create)
    end

    bundle_path = new_resource.subdirectory ? ::File.join(new_resource.path, new_resource.subdirectory) : new_resource.path

    br = bash "install gems in #{bundle_path}" do
      user new_resource.user
      cwd  bundle_path
      code "#{::File.join(new_resource.ruby_path, "bundle")} install --without=test --standalone"
      action :nothing
    end
    br.run_action(:run)
  end

  new_resource.updated_by_last_action(r.updated_by_last_action?)
end