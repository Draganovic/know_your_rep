require 'rails_helper'

describe SunlightService do
  it "it returns a list of legislators" do
    VCR.use_cassette("sunlight_service#legislators") do
    service = SunlightService.new
    legislators = service.legislators
    legislator = legislators.first

    expect(legislators.count).to eq(100)
    expect(legislator[:first_name]).to eq "Benjamin"
    expect(legislator[:last_name]).to eq "Sasse"
  end
  end
end
