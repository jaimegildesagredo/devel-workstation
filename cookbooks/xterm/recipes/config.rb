#
# Cookbook Name:: xterm
# Recipe:: config
#
# Copyright 2014, Jaime Gil de Sagredo
#
# All rights reserved - Do Not Redistribute
#

xresources_path = File.expand_path('~/.Xresources')

execute 'xrdb-merge' do
  command "xrdb -merge #{xresources_path}"
  returns [0, 1]  # Run without X server will fail
  action :nothing
end

node[:xterm][:config][:present].each do |key, value|
  replace_or_add "xterm-#{key}" do
    path xresources_path
    line "Xterm*#{key}: #{value}"
    pattern "^Xterm\\*#{key}: .*$"
    notifies :run, 'execute[xrdb-merge]'
    action :edit
  end
end
