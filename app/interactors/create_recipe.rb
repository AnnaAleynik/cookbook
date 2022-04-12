class CreateRecipe
  include Interactor::Organizer

  # binding.pry
  organize Recipes::Create

  delegate :recipe, :author, to: :context

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
