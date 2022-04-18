class RecipeMailer < ApplicationMailer
  def recipe_published_email(recipe)
    @recipe = recipe
    @user = recipe.author
    mail(to: @user.email, subject: "Your recipe was created on Cookbook!")
  end
end
