class CreateRecipe
  include Interactor::Organizer

  organize Recipes::Create

  delegate :recipe, to: :context

  after do
    schedule_notification
  end

  private

  def schedule_notification
    RecipeMailer
      .with(recipe: recipe)
      .recipe_published_email
      .deliver_later
  end
end
