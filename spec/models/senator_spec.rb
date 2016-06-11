require 'rails_helper'


RSpec.describe Senator do
  it "returns all senators" do
  VCR.use_cassette("senator#all") do
    senators = Senator.all
    senator = senators.first

    expect(senators.count).to eq(100)

    end
  end

  # it "returns a name state hash" do
  #   VCR.use_cassette("legislator#state_match_hash") do
  #   collection = Legislator.collection
  #   require "pry"; binding.pry
  #   smh = collection.state_match_hash
  #
  #   legislator = smh.first
  #
  #   expect(legislator.first_name).to eq "Bob"
  # end
  # end
end
