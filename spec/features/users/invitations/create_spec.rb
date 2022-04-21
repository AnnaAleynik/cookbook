require "rails_helper"

RSpec.feature "Create invitation" do
  include_context :admin_signed_in
  let(:invited_user) { User.last }

  # let(:delivery) { instance_double(ActionMailer::MessageDelivery) }
  # before do
  #   allow(delivery).to receive(:deliver_later)
  #   allow(DeviseMailer).to receive(:recipe_published_email).and_return(delivery)
  # end

  scenario "creating new manager" do
    visit new_user_invitation_path

    fill_in "Email", with: ""
    click_button "Send an invitation"
    expect(page).to have_content("Emailcan't be blank")

    fill_in "Email", with: "user@example.com"
    fill_in "First name", with: "User"
    fill_in "Last name", with: "Second"
    select "Manager", from: "Roles"

    click_button "Send an invitation"
    # expect mailer

    expect(page).to have_content("An invitation email has been sent to user@example.com.")
    expect(invited_user).to have_attributes(
      {
        email: "user@example.com",
        first_name: "User",
        last_name: "Second",
        login: "",
        password: nil,
        invited_by: current_user
      }
    )
    expect(invited_user.roles).to include(:manager)
  end
end
