require 'bundler/setup'
Bundler.setup
require 'vcr'

require_relative '../zap_analyzer'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
end
