require "rails_helper"

RSpec.feature "Create recipe" do
  include_context :user_signed_in

  scenario "successfully creating recipe" do
    visit new_users_recipe_path

    fill_in "Title", with: "First Recipe"
    fill_in "Content", with: "Just do it!"

    click_button "Create Recipe"

    expect(page).to have_content "First Recipe"
  end
end
