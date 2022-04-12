require "rails_helper"

RSpec.describe CreateRecipe do
  describe ".organized" do
    subject { described_class.organized }

    let(:expected_interactors) do
      [
        Recipes::Create
      ]
    end

    it { is_expected.to eq(expected_interactors) }
  end

  describe ".after" do
    let!(:recipe) { create :recipe }
    let(:organizer_context) do
      {
        recipe: recipe
      }
    end

    context "when context succeeds" do
      include_context :stubbed_organizer

      it "sends email notification" do
        # TODO: with jobs
      end
    end

    context "when context failures" do
      include_context :stubbed_organizer, failure: true

      it "doesn't send email notification" do
        # TODO: with jobs
      end
    end
  end
end
