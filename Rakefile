require 'bundler/gem_tasks'
require 'cucumber'
require 'cucumber/rake/task'
require 'inch/rake'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yard/rake/yardoc_task'

namespace :lint do
  Inch::Rake::Suggest.new(:docs)

  RuboCop::RakeTask.new(:style)
end

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = 'features --format pretty'
end

desc 'Run all linting tasks'
task lint: %w(lint:style lint:docs)

YARD::Rake::YardocTask.new

task default: %i(lint spec features)
