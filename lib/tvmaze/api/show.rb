require "json"
require "awesome_print"

module Tvmaze
  module Api
    class Show
      attr_reader :id, :url, :name, :type, :language, :genres, :status, :summary

      def initialize attributes
        ap attributes
        @id = attributes["id"]
        @url = attributes["url"]
        @name = attributes["name"]
        @type = attributes["type"]
        @language = attributes["language"]
        @genres = attributes["genres"]
        @status = attributes["status"]
        @summary = attributes["summary"]
      end

      def self.find id
        response = Tvmaze::Api::CONNECTION.get("/shows/#{id}")
        attributes = JSON.parse(response.body)
        new attributes
      end
    end

  end

end
