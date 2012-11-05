Description
===========

Helper cookbook that groups common functionality for all other
CloudFoundry cookbooks.

Requirements
============

Platform
--------

* Ubuntu

Tested on:

* Ubuntu 10.04

Cookbooks
---------

Require's Optcode's apt cookbook and Riot Games's rbenv cookbook.

Usage
=====

You should never need to use any recipes in this cookbook on their own.
Instead, you should include recipes from the higher level CloudFoundry
cookbooks such as `cloudfoundry-dea` and
`cloudfoundry-cloud_controller`.

Attributes
==========

User and group
--------------

* `cloudfoundry['user']` - User that will own and run CloudFoundry. Default is `cloudfoundry`.
* `cloudfoundry['group']` - Group of the user that will own and run CloudFoundry. Default is `cloudfoundry`.
* `cloudfoundry['uid']` - Uid of the user that will own and run CloudFoundry. Default is `1002`.
* `cloudfoundry['gid']` - Gid of the user that will own and run CloudFoundry. Default is `1002`.
* `cloudfoundry['home']` - Home of the user that will own and run CloudFoundry. Default is `/home/cloudfoundry`.

* `cloudfoundry['ruby_1_9_2_version']` - The exact version of ruby-1.9.2 to install. Default is `1.9.2-p290"`.
* `cloudfoundry['vcap'][:install_path]` - Where to install the CloudFoundry code. Default is `/srv/vcap"`.
* `cloudfoundry['vcap'][:repo]` - Repository to use when fetching the CloudFoundry code. Default is `https://github.com/cloudfoundry/vcap.git"`.
* `cloudfoundry['vcap'][:reference]` - Git reference to use when fetching the CloudFoundry code. Can be either a specific sha or a reference such as `HEAD` or `master`. Default is `e6378a1d7987557cb9316e73124db37e1a3268c8"`.
* `cloudfoundry['local_route']` - local_route is the IP address of a well known server on your network, it is used to choose the right ip address (think of hosts that have multiple nics and IP addresses assigned to them) of the host running the cloud controller. Default value of nil, should work in most cases. Default is `nil`.
* `cloudfoundry['capacity'][:memory]` - Maximum amount of memory that an application can request. Default is `2048`.
* `cloudfoundry['capacity'][:max_uris]` - Maximum number of uris to which an application can be bound. Default is `4`.
* `cloudfoundry['capacity'][:max_services]` - Maximum number of services to which an application can be bound. Default is `16`.
* `cloudfoundry['capacity'][:max_apps]` - Maximum number of applications that a user can have. Default is `20`.
* `cloudfoundry['droplets_dir']` - TODO (trotter): Find out what this does. Default is `/var/vcap/shared/droplets"`.
* `cloudfoundry['resources_dir']` - TODO (trotter): Find out what this does. Default is `/var/vcap/shared/resources"`.
* `cloudfoundry['staging_manifests_dir']` - TODO (trotter): Find out what this does. Default is `/var/vcap/shared/staging_manifests"`.
* `cloudfoundry['nats_server'][:host]` - Host of the Nats Server that all CloudFoundry components will use for messaging. Default is `localhost"`.
* `cloudfoundry['config_dir']` - Where to write config files for all CloudFoundry components. Default is `/etc/cloudfoundry"`.
* `cloudfoundry['log_dir']` - Where to write log files for all CloudFoundry components. Default is `/var/log/cloudfoundry"`.
* `cloudfoundry['pid_dir']` - Where  to write pid files for all CloudFoundry components. Default is `/var/run/cloudfoundry"`.

License and Author
==================

Author:: Trotter Cashion (<cashion@gmail.com>)

Copyright:: 2012 Trotter Cashion

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
