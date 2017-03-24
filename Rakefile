
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'foodcritic'
require 'kitchen/rake_tasks'
require 'kitchen/diagnostic'

# Style tests. Rubocop and Foodcritic
namespace :analyze do
  desc 'Run rubocop style checks'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.fail_on_error = true
    task.verbose       = true
    # looks like these are not being passed to auto_correct subtask
    task.options       = ['--only-guide-cops']
  end

  desc 'Run Foodcritic checks'
  FoodCritic::Rake::LintTask.new(:foodcritic) do |t|
    t.options = {
      fail_tags: ['any']
    }
  end
end

desc 'Run all code analysis checks'
task analyze: ['analyze:rubocop', 'analyze:foodcritic']

namespace :test do

  desc 'Run ChefSpec tests'
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = './**/unit/**/*_spec.rb'
  end

end

namespace :vagrant do
  desc 'List available Vagrant kitchen instances'
  task :list, :profile do |_, args|
    args.with_defaults(profile: '')
    current_local = ENV['KITCHEN_LOCAL_YAML']
    ENV['KITCHEN_LOCAL_YAML'] = '.kitchen.vagrant.yml'
    results = `kitchen list #{args.profile}`
    puts results
    ENV['KITCHEN_LOCAL_YAML'] = current_local
  end

  desc 'Create Vagrant Instance'
  task :create, :profile do |_, args|
    args.with_defaults(profile: 'default')
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(local_config: './.kitchen.vagrant.yml')
    config = Kitchen::Config.new(loader: @loader)
    instances = config.instances.get_all(/#{args.profile}/)
    instances.each do |instance|
      puts "Creating Instance #{instance.name}"
      instance.create
    end
  end

  desc 'Converge Vagrant instance'
  task :converge, :profile  do |_, args|
    args.with_defaults(profile: 'default')
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(local_config: './.kitchen.vagrant.yml')
    config = Kitchen::Config.new(loader: @loader)
    instances = config.instances.get_all(/#{args.profile}/)
    instances.each do |instance|
      puts "Converging Instance #{instance.name}"
      instance.converge
    end
  end

  desc 'Verify Vagrant instance'
  task :verify, :profile  do |_, args|
    args.with_defaults(profile: 'default')
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(local_config: './.kitchen.vagrant.yml')
    config = Kitchen::Config.new(loader: @loader)
    instances = config.instances.get_all(/#{args.profile}/)
    instances.each do |instance|
      puts "Verifying Instance #{instance.name}"
      instance.verify
    end
  end

  desc 'Login to Existing Vagrant instance'
  task :login, :profile  do |_, args|
    args.with_defaults(profile: 'default')
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(local_config: './.kitchen.vagrant.yml')
    config = Kitchen::Config.new(loader: @loader)
    instances = config.instances.get_all(/#{args.profile}/)
    if instances.size > 1
      puts "WARN: Argument #{args.profile} returned multiple results"
    elsif instances.size.zero?
      puts "WARN: Argument #{args.profile} returned no results"
    else
      instance = instances.pop
      instance.login
    end
  end

  desc 'Destroy Vagrant instances'
  task :destroy, :profile  do |_, args|
    args.with_defaults(profile: 'default')
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(local_config: './.kitchen.vagrant.yml')
    config = Kitchen::Config.new(loader: @loader)
    instances = config.instances.get_all(/#{args.profile}/)
    instances.each do |instance|
      puts 'Destroying instances'
      instance.destroy
    end
  end
end
# Default
desc 'Run code analysis and unit tests'
task default: %w(analyze test:unit)
