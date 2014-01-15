#
# Cookbook Name:: znc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "znc" do
  action :install
end

directory "/var/lib/znc/configs" do
  owner "znc"
  group "znc"
  mode 00700
  action :create
end

template "/var/lib/znc/configs/znc.conf" do
  owner "znc"
  group "znc"
  mode "600"
  action :create
  source "znc.conf.erb"
  notifies :restart, "service[znc]"
end

service "znc" do
  action [:enable]
end
