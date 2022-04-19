require "rails_helper"

RSpec.describe RecipeMailer do
  describe "recipe_published_email" do
    subject(:email) { described_class.recipe_published_email(recipe) }

    let(:recipe) { create :recipe }
    let(:user) { recipe.author }

    it "delivers the info" do
      expect(email.to).to eq([user.email])
      expect(email.body.encoded).to match(recipe.title)
    end
  end
end
