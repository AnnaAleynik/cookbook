require "rails_helper"

RSpec.feature "Sign In" do
  scenario "Successful sign in" do
    binding.pry
    visit new_user_session_path
  end
end
