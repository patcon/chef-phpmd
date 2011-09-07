#
# Cookbook Name:: phpmd
# Recipe:: default
#
# Copyright 2011, Myplanet Digital
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

require_recipe "php::module_pear"

w%{ pear.phpmd.org pear.pdepend.org }.each do |channel|
  php_pear_package channel do
    action :discover
  end
end

php_pear "PHP_PMD" do
  version node['phpmd']['version']
  channel "phpmd"
  options "--alldeps"
  action :install
end
