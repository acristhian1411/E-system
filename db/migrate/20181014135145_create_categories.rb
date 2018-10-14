class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_descrip
      t.boolean :category_active

      t.timestamps
    end
  end
end
