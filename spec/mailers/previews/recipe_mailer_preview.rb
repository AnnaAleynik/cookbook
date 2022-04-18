class RecipeMailerPreview < ActionMailer::Preview
  def recipe_published_email
    RecipeMailer.recipe_published_email(
      FactoryBot.create(:recipe)
    )
  end
end
