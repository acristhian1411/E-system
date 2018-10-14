class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apellido
      t.string :n_cedula
      t.string :cli_telefono
      t.integer :limite_credito
      t.boolean :activo
      t.references :ciudades, foreign_key: true
      t.references :barrio, foreign_key: true

      t.timestamps
    end
  end
end
