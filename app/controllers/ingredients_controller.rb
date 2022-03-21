class IngredientsController < ApplicationController
  expose :ingredient
  expose :ingredients, -> { Ingredient.all }

  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
    if ingredient.save
      redirect_to ingredient_path(ingredient)
    else
      render :new
    end
  end

  def update
    if ingredient.update(ingredient_params)
      redirect_to ingredient_path(ingredient)
    else
      render :new
    end
  end

  def destroy
    ingredient.destroy

    redirect_to ingredients_url, notice: "Ingredient was successfully destroyed."
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:title)
  end
end
