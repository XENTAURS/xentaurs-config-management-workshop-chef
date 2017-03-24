#
# Cookbook Name:: xentaurs-config-management-workshop-chef
# Recipe:: default
#
# Copyright (c) 2017 Xentaurs, All Rights Reserved.

case node['platform_family']
when 'windows'
  # If your cookbook is not designed to work on Windows, leave this block as is
  # See https://docs.chef.io/windows.html for more information on how to use Chef on Windows
  raise 'Windows is not a supported platform!'

when 'rhel'
  include_recipe 'xentaurs-config-management-workshop-chef::install'

else
  raise 'unsupported platform!'
end
