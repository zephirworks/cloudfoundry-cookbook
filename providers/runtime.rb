#
# Cookbook Name:: cloudfoundry
# Provider:: runtime
#
# Copyright 2012, ZephirWorks
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

action :create do
  updated = false

  if node['cloudfoundry']['runtimes'] && node['cloudfoundry']['runtimes'][new_resource.name]
    log "Redefining existing runtime #{new_resource.name}" do
      level :warn
    end
  else
    log "Defining a new runtime: #{new_resource.name}"
    updated = true
  end

  node_attrs = node.default['cloudfoundry']['runtimes'][new_resource.name]
  node_attrs['name']          = new_resource.name
  node_attrs['executable']    = new_resource.executable
  node_attrs['version']       = new_resource.version
  node_attrs['version_flag']  = new_resource.version_flag
  node_attrs['default']       = new_resource.default

  new_resource.updated_by_last_action(updated)
end
