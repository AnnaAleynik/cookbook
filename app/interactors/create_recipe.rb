class CreateRecipe
  include Interactor::Organizer

  organize Recipes::Create

  delegate :recipe, to: :context
  delegate :author, to: :recipe, prefix: true

  after do
    schedule_notification
  end

  private

  def schedule_notification
    RecipeMailer
      .with(user: author, recipe: recipe)
      .recipe_published_email
      .deliver_later
  end
end
