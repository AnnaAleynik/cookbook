class RecipePublishedJob < ApplicationJob
  queue_as :default

  def perform(params)
    RecipeMailer
      .with(user: user, recipe: recipe)
      .recipe_published_email
      .deliver_later
  end

  attr_reader :params

  def user
    recipe.author
  end

  def recipe
    @recipe ||= Recipe.find(recipe_id)
  end
end
