class RecipeMailer < ApplicationMailer
  def recipe_published_email
    @user = params[:user]
    @recipe = @user.recipe
    mail(to: @user.email, subject: "Your recipe was created on Cookbook!")
  end
end
