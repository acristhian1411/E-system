class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.string :subcat_descrip
      t.boolean :subcat_active
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
