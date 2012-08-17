# The exact version of ruby-1.9.2 to install.
default['cloudfoundry']['ruby_1_9_2_version'] = "1.9.2-p290"

# User that will own and run CloudFoundry.
default['cloudfoundry']['user'] = ENV['USER']

# local_route is the IP address of a well known server on your network, it
# is used to choose the right ip address (think of hosts that have multiple nics
# and IP addresses assigned to them) of the host running the cloud controller. Default
# value of nil, should work in most cases.
default['cloudfoundry']['local_route'] = nil

# Maximum amount of memory that an application can request.
default['cloudfoundry']['capacity']['memory'] = 2048

# Maximum number of uris to which an application can be bound.
default['cloudfoundry']['capacity']['max_uris'] = 4

# Maximum number of services to which an application can be bound.
default['cloudfoundry']['capacity']['max_services'] = 16

# Maximum number of applications that a user can have.
default['cloudfoundry']['capacity']['max_apps'] = 20

# TODO (trotter): Find out what this does.
default['cloudfoundry']['shared_dir'] = "/var/vcap/shared"

# Path to the directory used by services to store private data.
default['cloudfoundry']['services_dir'] = "/var/vcap/services"

# Path to the directory used by components to store private data.
default['cloudfoundry']['data_dir'] = "/var/vcap/data"

# Host of the Nats Server that all CloudFoundry components will use for
# messaging.
default['cloudfoundry']['nats_server']['host'] = "localhost"

# Host of the Nats Server that all CloudFoundry components will use for
# messaging.
default['cloudfoundry']['nats_server']['port'] = "4222"

# Where to write config files for all CloudFoundry components.
default['cloudfoundry']['config_dir'] = "/etc/cloudfoundry"

# Where to write log files for all CloudFoundry components.
default['cloudfoundry']['log_dir']    = "/var/log/cloudfoundry"

# Where  to write pid files for all CloudFoundry components.
default['cloudfoundry']['pid_dir']    = "/var/run/cloudfoundry"

# The token to use to authenticate services to cloudfoundry. This _may_
# not be safe to change.
default['cloudfoundry']['service_token'] = "0xdeadbeef"

default['cloudfoundry']['vcap_services']['install_path'] = "/srv/vcap-srv"
default['cloudfoundry']['vcap_services']['repo'] = "https://github.com/cloudfoundry/vcap-services.git"
default['cloudfoundry']['vcap_services']['reference'] = "ac31866f8568593d8499ad07c5a74ae7ed527aa4"

# The role that will be used to search for a cloud_controller node.
default['cloudfoundry']['cloud_controller_role'] = 'cloudfoundry_cloud_controller'

# The role that will be used to search for a nats-server node.
default['cloudfoundry']['nats_server_role'] = 'cloudfoundry_nats_server'

# The role that will be used to search for a redis_vcap node.
default['cloudfoundry']['vcap_redis_role'] = 'cloudfoundry_redis_vcap'
