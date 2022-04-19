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

  describe ".call" do
    include_context :interactor
    let(:initial_context) { { recipe: recipe } }
    let(:recipe) { build :recipe }

    it "creates recipe" do
      expect { interactor.run }.to change(Recipe, :count).by(1)
    end
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
        interactor.run
        expect(RecipePublishedJob).to have_been_enqueued
      end
    end

    context "when context failures" do
      include_context :stubbed_organizer, failure: true

      it "doesn't send email notification" do
        interactor.run
        expect(RecipePublishedJob).not_to have_been_enqueued
      end
    end
  end
end
