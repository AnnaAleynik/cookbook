RSpec.shared_context :invited_user do
  let(:manager) { create :manager }
  let(:invitation_params) do
    {
      email: email,
      first_name: first_name,
      last_name: last_name,
      roles: roles,
      skip_invitation: true
    }
  end
  let(:email) { Faker::Internet.safe_email }
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }
  let(:roles) { %w(manager moderator coordinator) }

  let(:invited_user) { User.invite!(invitation_params, manager) }
end
