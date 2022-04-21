require "rails_helper"

RSpec.feature "Accept invitation" do
  include_context :invited_user
  let(:invitation_token) { invited_user.instance_variable_get(:@raw_invitation_token) }

  scenario "creating new manager" do
    visit accept_user_invitation_path(invitation_token: invitation_token)

    fill_in "Login", with: "Invited User"
    click_button "Save"

    expect(page).to have_content("Passwordcan't be blank")

    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Save"

    expect(page).to have_content("Your password was set successfully. You are now signed in.")

    visit profile_path

    expect(page).to have_content("Invited User")
    expect(page).to have_content("manager, moderator, coordinator")
    expect(page).to have_content("Пригласить сотрудника")
  end
end
