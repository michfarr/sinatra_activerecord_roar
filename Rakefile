# frozen_string_literal: true
require './app'
require 'sinatra/activerecord/rake'

if %w(development test).include?(ENV['RACK_ENV'])
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new do |t|
    t.cucumber_opts = %w(--format progress)
  end

  task default: [:rubocop, :cucumber]
end
