require 'rails_helper'

describe SunlightService do
  it "it returns a list of senators" do
    VCR.use_cassette("sunlight_service#senators") do
    service = SunlightService.new
    senators = service.senators_hash
    senator = senators.first

    expect(senators.count).to eq(100)
    expect(senator[:first_name]).to eq "Benjamin"
    expect(senator[:last_name]).to eq "Sasse"
    end
  end
end
