ActiveAdmin.register Cliente do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cliente", label: " Clientes"
 permit_params :nombre, :apellido, :n_cedula, :direccion, :cli_telefono, :limite_credito, :activo, :ciudade_id, :barrio_id

 # lista segun activo o no
 scope :inactivo
 scope :activo
 scope :todos

# tabla en index
 index title: "Clientes" do
  column "Nombre", :nombre, :apellido
 	column "Numero de cedula", :n_cedula
 	column "Direccion", :direccion
 	actions
 end

# Formulario personalizado
form title: 'Clientes' do |f|
    inputs 'Detalles' do
      f.input :nombre, label: "Nombre"
      f.input :apellido, label: "Apellido"
      f.input :n_cedula, label: "Num de Cedula"
      f.input :direccion, label: "Direccion"
      f.input :cli_telefono, label: "Num de telefono"
      f.input :limite_credito, label: "Limite de credito"
      f.input :activo, label: "Activo"
      f.input :ciudade_id,  label: "Ciudad", :as => :select, :collection => Ciudade.all.map{|a|["#{a.descripcion}", a.id]}
      f.input :barrio_id,  label: "Barrio", :as => :select, :collection => Barrio.all.map{|a|["#{a.descripcion}", a.id]}
    end
      f.actions
    end
end
