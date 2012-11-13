#
# Cookbook Name:: cloudfoundry
#
# Copyright 2012, Trotter Cashion
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

require 'chef/shell_out'

class Chef
  # Increasing the default shellout timeout to an hour, because there's
  # a number of chef related things that can take longer than 10
  # minutes.
  #
  # Will only work on Chef <= 0.10.8. After that, Mixlib::ShellOut is
  # used.
  class ShellOut
    DEFAULT_READ_TIMEOUT=3600
  end
end
