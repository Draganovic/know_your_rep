require "rails_helper"

RSpec.feature "senator displays on show" do
  scenario "they display and get shoveled into used" do
    sen = Senator.create(name: "Bob Dole", state_name: "Kansas")
    user = User.new(name: "Beth")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    # game = Game.create(score: 0, user_id: user.id)
    visit root_path
    click_on "Start game"

    expect(current_path).to eq game_path(Game.first.id)

    expect(page).to have_content "Bob Dole"

    fill_in "State", with: "Colorado"

    click_on "Submit"

    expect(page).to have_content "Game over. Your score is 0"
  end
end
