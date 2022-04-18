require "rails_helper"

RSpec.describe RecipePublishedJob, type: :job do
  let(:execute_worker) { described_class.new.perform(recipe.id) }

  let(:recipe) { create :recipe }

  let(:delivery) { instance_double(ActionMailer::MessageDelivery) }

  before do
    allow(delivery).to receive(:deliver_now)
    allow(RecipeMailer).to receive(:recipe_published_email).and_return(delivery)
  end

  describe "#perform" do
    it "send recipe published email" do
      expect(RecipeMailer).to receive(:recipe_published_email)

      execute_worker
    end
  end
end
