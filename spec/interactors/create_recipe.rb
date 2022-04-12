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

    context "send email notification" do
      include :stubbed_interactor

    end
  end
end
