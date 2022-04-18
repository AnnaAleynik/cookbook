class CreateRecipe
  include Interactor::Organizer

  organize Recipes::Create

  delegate :recipe, to: :context

  after do
    schedule_notification
  end

  private

  def schedule_notification
    RecipePublishedJob.perform_later(recipe.id)
    # RecipeMailer.recipe_published_email(recipe).deliver_later
  end
end
