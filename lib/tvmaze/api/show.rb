require "json"

module Tvmaze
  module Api
    class Show
      attr_reader(
        :id, :url, :name, :type, :language, :genres, :status, :summary, :runtime, :premiered, :schedule,
        :rating, :externals, :image, :links, :updated
      )

      def initialize attributes
        @id = attributes["id"]
        @url = attributes["url"]
        @name = attributes["name"]
        @type = attributes["type"]
        @language = attributes["language"]
        @genres = attributes["genres"]
        @status = attributes["status"]
        @summary = attributes["summary"]
        @runtime = attributes["runtime"]
        @premiered = Date.parse attributes["premiered"]
        @schedule = attributes["schedule"]
        @rating = attributes["rating"]["average"]
        @externals = attributes["externals"]
        @image = attributes["image"]
        @links = attributes["_links"]
        @updated = Time.at attributes["updated"]
      end

      def self.find id
        response = Tvmaze::Api::CONNECTION.get("/shows/#{id}")
        attributes = JSON.parse(response.body)
        new attributes
      end
    end

  end

end
