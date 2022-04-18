module Users
  class RecipesController < BaseController
    expose :recipe

    def new
    end

    def create
      if create_recipe.success?
        redirect_to recipe_path(recipe)
      else
        render :new
      end
    end

    def edit
    end

    def update
      if recipe.save
        redirect_to recipe_path(recipe)
      else
        render :edit
      end
    end

    def destroy
      recipe.destroy
    end

    private

    def create_recipe
      @create_recipe ||= ::CreateRecipe.call!(recipe: recipe)
    end

    def authorize_resource!
      authorize! recipe
    end

    def recipe_params
      params.require(:recipe).permit(:title, :content).merge(author: current_user)
    end
  end
end
