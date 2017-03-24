# Install Apache
#

package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do
  content 'Automation for the People'
  mode '0777'
end

service 'httpd' do
  action [:enable, :start]
end
