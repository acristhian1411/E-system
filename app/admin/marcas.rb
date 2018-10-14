ActiveAdmin.register Marca do
	
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :marca_descrip, :marca_active, :created_at, :updated_at
#

form title: 'Marcas' do |f|
    inputs 'Detalles' do
      input :marca_descrip, label: "Descripcion"
      input :marca_active, label: "Activo"
    end

    para "Presione cancelar para regresar a la lista sin guardar los cambios"
    actions
  	end

end
