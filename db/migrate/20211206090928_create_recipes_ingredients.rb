class CreateRecipesIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes_ingredients do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.string :count

      t.timestamps
    end
  end
end
