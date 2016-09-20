require 'spec_helper'

describe Tvmaze::Api do
  it 'has a version number' do
    expect(Tvmaze::Api::VERSION).not_to be nil
  end

  it 'has a connection' do
    expect(Tvmaze::Api::CONNECTION).not_to be nil
  end
end
