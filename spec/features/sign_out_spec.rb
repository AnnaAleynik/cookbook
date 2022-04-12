require "rails_helper"

RSpec.feature "Sign Out" do
  include_context :user_signed_in

  scenario "Successful sign in" do
    visit root_path

    click_button "Выйти"

    expect(page).to have_content "Signed out successfully."
  end
end
