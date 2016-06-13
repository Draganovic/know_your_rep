require 'rails_helper'


RSpec.describe Senator do
  it "returns all senators" do
  VCR.use_cassette("senator#all") do
    expect(Senator.all.count).to eq(0)
    SunlightService.new.load_data

    expect(Senator.all.count).to eq(100)
    SunlightService.new.load_data
    expect(Senator.all.count).to eq(100)
    end
  end
end
