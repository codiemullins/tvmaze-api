require 'faraday'
require 'faraday_middleware'
require 'singleton'

module Tvmaze
  module Api
    class Connection

      include Singleton

      def initialize
        @conn = Faraday.new(url: 'http://api.tvmaze.com') do |faraday|
          faraday.use FaradayMiddleware::FollowRedirects
          faraday.adapter  :net_http_persistent
        end
      end

      def conn
        @conn
      end

    end

  end

end
