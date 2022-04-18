require "rails_helper"

RSpec.describe Recipes::Create do
  describe ".call" do
    include_context :interactor

    let(:initial_context) do
      {
        recipe: recipe
      }
    end

    let(:user) { create :user }
    let(:recipe) { build :recipe, title: title, content: "Content", author: user }

    context "when valid params" do
      let(:title) { "Cream Soup" }

      it "creates recipe" do
        interactor.run
        expect(context).to be_success

        recipe.reload

        expect(recipe).to have_attributes(title: "Cream Soup", content: "Content", author: user)
      end
    end

    context "with invalid params" do
      let(:title) { "N" }
      let(:error) { "Title is too short (minimum is 3 characters)" }

      it "raise failure" do
        expect { interactor.run }.not_to change(Recipe, :count)

        expect(context).to be_failure
        expect(context.error).to eq(error)
      end
    end
  end
end
