#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2014, Jaime Gil de Sagredo
#
# All rights reserved - Do Not Redistribute
#

directory node[:dotfiles][:prefix] do
  recursive true
  action :create
end

git node[:dotfiles][:prefix] do
  repository node[:dotfiles][:repository]
  revision node[:dotfiles][:branch]
  checkout_branch node[:dotfiles][:branch]
  action :sync
end

execute "cd #{node[:dotfiles][:prefix]} && ./setup.sh"
