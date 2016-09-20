require 'spec_helper'

describe Tvmaze::Api::Connection do
  subject { Tvmaze::Api::Connection.instance.conn }

  it "does not raise" do
    expect { subject }.to_not raise_error
  end

  it "has a uri_prefix of api.tvmaze.com" do
    uri = URI::HTTP.build host: "api.tvmaze.com"
    expect(subject.url_prefix).to eq uri
  end

end
