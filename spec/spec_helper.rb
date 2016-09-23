require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'tvmaze/api'
require 'faraday'
require 'faraday_middleware'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :faraday
end

Tvmaze::Api::CONNECTION = Faraday.new(url: 'http://api.tvmaze.com') do |faraday|
  faraday.use VCR::Middleware::Faraday
  faraday.use FaradayMiddleware::FollowRedirects
  faraday.adapter  :net_http_persistent
end
