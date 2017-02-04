require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

RSpec::Core::RakeTask.new(:spec)


desc 'run both BDD and Unit tests'
task :all_tests do
  Rake::Task["spec"].invoke
  Rake::Task["features"].invoke
end

task :default => :all_tests
