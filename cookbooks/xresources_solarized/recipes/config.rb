#
# Cookbook Name:: xresources_solarized
# Recipe:: default
#
# Copyright 2014, Jaime Gil de Sagredo
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

xresources_path = File.expand_path('~/.Xresources')

execute 'xrdb-merge' do
  command "xrdb -merge #{xresources_path}"
  returns [0, 1]  # Run without X server will fail
  action :nothing
end

node[:xresources_solarized][:config][:present].each do |key, value|
  replace_or_add "xresources-solarized-#{key}" do
    path xresources_path
    line "#{key}: #{value}"
    pattern "#{Regexp.escape(key)}: .*$"
    notifies :run, 'execute[xrdb-merge]'
    action :edit
  end
end
