zrequire "rails_helper"

RSpec.describe RecipePublishedJob, type: :job do
  let(:execute_worker) { described_class.new.perform(recipe.id) }

  let(:recipe) { create :recipe }
  let(:action_mail) { double deliver_now: true }

  describe "#perform" do
    it "send recipe published email" do
      expect(RecipeMailer).to receive(:recipe_published_email).with(recipe) { action_mail }
      expect(action_mail).to receive(:deliver_now)

      execute_worker
    end
  end
end
