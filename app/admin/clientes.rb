ActiveAdmin.register Cliente do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :nombre, :apellido, :n_cedula, :cli_telefono, :limite_credito, :activo, :ciudade_id, :barrio_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
form title: 'Clientes' do |f|
    inputs 'Detalles' do
      f.input :nombre, label: "nombre"
      f.input :apellido, label: "apellido"
      f.input :n_cedula, label: "n_cedula"
      f.input :cli_telefono, label: "cli_telefono"
      f.input :limite_credito, label: "limite_credito"
     f.input :activo, label: "Activo"
      
      f.input :ciudade_id,  label: "Ciudad", :as => :select, :collection => Ciudade.all.map{|a|["#{a.descripcion}", a.id]}
      f.input :barrio_id,  label: "Barrio", :as => :select, :collection => Barrio.all.map{|a|["#{a.descripcion}", a.id]}


    end
    para "Presione cancelar para regresar a la lista sin guardar los cambios"
    f.actions
    end
end
