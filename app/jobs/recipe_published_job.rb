class RecipePublishedJob < ApplicationJob
  queue_as :default

  def perform(recipe_id)
    @recipe_id = recipe_id
    RecipeMailer.recipe_published_email(recipe).deliver_now
  end

  private

  def recipe
    @recipe ||= Recipe.find(@recipe_id)
  end
end
