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

# Host of the Nats Server that all CloudFoundry components will use for
# messaging.
default['cloudfoundry']['nats_server']['host'] = "localhost"

# Host of the Nats Server that all CloudFoundry components will use for
# messaging.
default['cloudfoundry']['nats_server']['port'] = "4222"

# The token to use to authenticate services to cloudfoundry. This _may_
# not be safe to change.
default['cloudfoundry']['service_token'] = "0xdeadbeef"

# The role that will be used to search for a cloud_controller node.
default['cloudfoundry']['cloud_controller_role'] = 'cloudfoundry_cloud_controller'

# The role that will be used to search for a nats-server node.
default['cloudfoundry']['nats_server_role'] = 'cloudfoundry_nats_server'

# The role that will be used to search for a redis_vcap node.
default['cloudfoundry']['vcap_redis_role'] = 'cloudfoundry_redis_vcap'
