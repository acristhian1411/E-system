class AddEmailToVersions < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :email, :string
  end
end
