class IngredientsController < ApplicationController
  expose :ingredient
  expose :ingredients, -> {Ingredient.all}

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
    if ingredient.save
      redirect_to ingredient_path(ingredient)
    else
      render :new
    end
  end
end
