module Users
  class RecipesController < BaseController
    expose :recipe

    def create
      recipe.author = current_user
      if recipe.save
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

    def recipe_params
      params.require(:recipe).permit(:title, :content)
    end
  end
end
