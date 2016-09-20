require 'spec_helper'
require 'vcr'

VCR.use_cassette 'single_show' do
  describe Tvmaze::Api::Show.find(4) do

    it { is_expected.to be_an_instance_of Tvmaze::Api::Show }

    it do
      is_expected.to have_attributes(
        id: 4,
        name: "Arrow",
        genres: a_kind_of(Array),
        summary: a_kind_of(String)
      )
    end

  end
end
