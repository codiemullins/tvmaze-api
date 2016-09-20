require 'spec_helper'
require 'vcr'

VCR.use_cassette 'single_show' do
  describe Tvmaze::Api::Show.find(4) do

    it { is_expected.to be_an_instance_of Tvmaze::Api::Show }

    it do
      is_expected.to have_attributes(
        id: 4,
        name: "Arrow",
        status: "Running",
        runtime: a_kind_of(Fixnum),
        genres: a_kind_of(Array),
        summary: a_kind_of(String),
        premiered: Date.parse('2012-10-10'),
        schedule: a_kind_of(Hash),
        rating: 7.9,
        externals: a_kind_of(Hash),
        image: a_kind_of(Hash),
        links: a_kind_of(Hash),
        updated: a_kind_of(Time),
      )
    end

  end
end
