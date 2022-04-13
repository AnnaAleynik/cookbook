module Recipes
  class Create
    include Interactor
    delegate :author, :recipe, to: :context

    def call
      recipe.author = author
      context.fail!(error: recipe_errors) unless recipe.save
    end

    private

    def recipe_errors
      recipe.errors.full_messages.join(", ")
    end
  end
end
