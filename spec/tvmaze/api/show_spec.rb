require "spec_helper"
require "vcr"

shared_examples "single show" do
  it { is_expected.to be_an_instance_of Tvmaze::Api::Show }

  it { is_expected.to have_attributes(id: 4) }
  it { is_expected.to have_attributes(name: "Arrow") }
  it { is_expected.to have_attributes(status: "Running") }
  it { is_expected.to have_attributes(runtime: a_kind_of(Fixnum)) }
  it { is_expected.to have_attributes(genres: a_kind_of(Array)) }
  it { is_expected.to have_attributes(summary: a_kind_of(String)) }
  it { is_expected.to have_attributes(premiered: Date.parse("2012-10-10")) }
  it { is_expected.to have_attributes(schedule: a_kind_of(Hash)) }
  it { is_expected.to have_attributes(rating: 7.9) }
  it { is_expected.to have_attributes(externals: a_kind_of(Hash)) }
  it { is_expected.to have_attributes(image: a_kind_of(Hash)) }
  it { is_expected.to have_attributes(links: a_kind_of(Hash)) }
  it { is_expected.to have_attributes(updated: a_kind_of(Time)) }
end

describe Tvmaze::Api::Show do

  describe '.find' do
    subject { VCR.use_cassette("single_show") { Tvmaze::Api::Show.find(4) } }
    include_examples "single show"
  end

  describe ".search" do
    context "when single-search" do
      subject { VCR.use_cassette("single_search") { Tvmaze::Api::Show.search("Arrow", true) } }
      include_examples "single show"
    end

    context "when full search" do
      subject { VCR.use_cassette("search") { Tvmaze::Api::Show.search("Arrow") } }
      it { is_expected.not_to be_empty }
      it { is_expected.to be_a_kind_of Array }
      it { is_expected.to all( have_attributes(id: a_kind_of(Fixnum)) ) }
    end
  end

  describe ".lookup" do
    subject { VCR.use_cassette("lookup") { Tvmaze::Api::Show.lookup({thetvdb: 257655}) } }
    include_examples "single show"
  end

end
