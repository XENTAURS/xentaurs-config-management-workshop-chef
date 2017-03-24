# # encoding: utf-8

# Inspec test for recipe xentaurs-config-management-workshop-chef::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

describe port(80) do
  it { should be_listening }
end

describe package('httpd') do
  it { should be_installed }
end

describe file('/var/www/html/index.html') do
  it { should be_file }
  its('content') { should match (/Automation for the People/) }
end
