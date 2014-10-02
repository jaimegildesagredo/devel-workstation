#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2014, Jaime Gil de Sagredo
#
# All rights reserved - Do Not Redistribute
#


git node[:dotfiles][:prefix] do
  repository node[:dotfiles][:repository]
  revision node[:dotfiles][:version]
  enable_checkout false
  action :sync
  notifies :run , "execute[setup-dotfiles]", :immediately
end

execute "setup-dotfiles" do
  command "./setup.sh"
  cwd node[:dotfiles][:prefix]
  action :nothing
end
