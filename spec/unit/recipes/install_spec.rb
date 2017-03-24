#
# Cookbook Name:: xentaurs-config-management-workshop-chef
# Spec:: default
#
# Copyright (c) 2017 Xentaurs, All Rights Reserved.

require 'spec_helper'

describe 'xentaurs-config-management-workshop-chef::default' do
  # Add all versions of RHEL the cookbook supports to this array.
  # If different versions of RHEL behave differently, you may need to break out
  # this loop into completely separate ChefSpec runs for each RHEL version.
  rhel_versions = ['7.2']

  rhel_versions.each do |version|
    context "default run on RHEL Versions #{version}" do
      let(:chef_run) do
        runner = ChefSpec::SoloRunner.new(platform: 'redhat', version: version)
        runner.converge(described_recipe)
      end

      it 'converges successfully on RHEL' do
        expect { chef_run }.to_not raise_error
      end

      it 'installs httpd' do
        expect(chef_run).to install_package('httpd')
      end
      it 'creates file /var/www/html/index.html' do
        expect(chef_run).to create_file('/var/www/html/index.html')
      end
      it 'start service httpd' do
        expect(chef_run).to enable_service('httpd')
        expect(chef_run).to start_service('httpd')
      end

    end
  end
end
