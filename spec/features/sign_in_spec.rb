require "rails_helper"

RSpec.feature "Sign In" do
  let!(:user) { create :user, email: "first.user@test.com" }

  scenario "Successful sign in" do
    visit new_user_session_path

    fill_in "Email", with: "first.user@test.com"
    fill_in "Password", with: "password"

    click_button "Log in"

    visit profile_path

    expect(page).to have_content "first.user@test.com"
  end
end
