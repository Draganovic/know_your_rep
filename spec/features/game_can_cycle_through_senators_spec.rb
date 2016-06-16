require "rails_helper"

RSpec.feature "senator displays on show" do
  scenario "they display and get shoveled into used" do
    VCR.use_cassette("sunlight_service") do
    sen = Senator.create(name: "Bob Dole", state_name: "Kansas")
    user = User.create(name: "Beth")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit root_path

    click_on "Start game"

    expect(current_path).to eq game_path(Game.last.id)

    expect(page).to have_content "Bob Dole"

    fill_in "State", with: "Colorado"

    click_on "Submit"

    expect(current_path).to eq game_over_path

    expect(page).to have_content "Game over. Your score is 0"
  end
end

  # scenario "they guess right" do
  #   sen1 = Senator.create(name: "Bob Dole", state_name: "Kansas")
  #   sen2 = Senator.create(name: "Frank Hans", state_name: "Utah")
  #   user = User.new(name: "Beth")
  #   ApplicationController.any_instance.stubs(:current_user).returns(user)
  #
  #   visit root_path
  #
  #   click_on "Start game"
  #
  #   expect(current_path).to eq game_path(Game.first.id)
  #
  #   expect(page).to have_content "Bob Dole"
  #
  #   fill_in "State", with: "Kansas"
  #
  #   click_on "Submit"
  #
  #   expect(page).to have_content "Frank Hans"
  #
  #   fill_in "State", with: "Colorado"
  #
  #   expect(page).to have_content "Game over. Your score is 1"
  # end
end
