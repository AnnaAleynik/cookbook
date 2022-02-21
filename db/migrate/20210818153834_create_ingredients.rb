class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :title, null: false, index: { unique: true }
    end
  end
end
