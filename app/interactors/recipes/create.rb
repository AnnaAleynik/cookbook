module Recipes
  class Create
    include Interactor
    delegate :recipe_params, :author, :recipe, to: :context

    def call
      # binding.pry
      recipe.author = author
      context.fail!(error: recipe_errors) unless recipe.save!
    end

    private

    def recipe_errors
      recipe.errors.full_messages.join(", ")
    end
  end
end
