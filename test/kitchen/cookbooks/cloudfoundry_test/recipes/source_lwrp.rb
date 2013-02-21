#
# Cookbook Name:: cloudfoundry_test
# Recipe:: default
#
# Copyright 2013, ZephirWorks
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

ruby_ver = node['cloudfoundry']['ruby_version']
ruby_path = ruby_bin_path(ruby_ver)

include_recipe "cloudfoundry::user"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby ruby_ver

cloudfoundry_source "dea" do
  path          "/tmp/source_lwrp/dea"
  repository    "https://github.com/cloudfoundry/dea.git"
  reference     "0ad8c731844335440078c254a1db767dc0d357ae"
end
