# frozen_string_literal: true

require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec

task default: %i[cop spec]
