#
# Cookbook Name:: i3
# Recipe:: config
#
# Copyright 2014, Jaime Gil de Sagredo
#
# All rights reserved - Do Not Redistribute
#

directory File.dirname(node[:i3][:config][:path]) do
  recursive true
  action :create
end

template node[:i3][:config][:path]
