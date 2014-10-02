#
# Cookbook Name:: i3status
# Recipe:: config
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

i3status_conf = File.expand_path('~/.config/i3status/config')

directory File.dirname(i3status_conf) do
  recursive true
  action :create
end

template i3status_conf
