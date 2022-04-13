require "rails_helper"

RSpec.describe Recipes::Create do
  describe ".call" do
    include_context :interactor

    let(:initial_context) do
      {
        recipe: recipe,
        author: user
      }
    end

    let(:user) { create :user }
    let(:recipe) { build :recipe, recipe_params }
    let(:recipe_params) do
      {
        title: title,
        content: "Content"
      }
    end

    context "when valid params" do
      let(:title) { "Cream Soup" }

      it "creates recipe" do
        interactor.run
        expect(context).to be_success

        recipe.reload

        expect(recipe.title).to eq("Cream Soup")
        expect(recipe.content).to eq("Content")
      end
    end

    context "with invalid params" do
      let(:title) { "N" }
      let(:error) { "Title is too short (minimum is 3 characters)" }

      it "raise failure" do
        interactor.run

        expect(context).to be_failure
        expect(context.error).to eq(error)
      end
    end
  end
end
