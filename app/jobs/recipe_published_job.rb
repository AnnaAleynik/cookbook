class RecipePublishedJob < ApplicationJob
  queue_as :default

  def perform(recipe_id)
    @recipe_id = recipe_id
    send_email
  end

  private

  def send_email
    binding.pry
    RecipeMailer
      .with(recipe: recipe)
      .recipe_published_email
      .deliver_now
  end

  def recipe
    @recipe ||= Recipe.find(@recipe_id)
  end
end
