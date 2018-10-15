ActiveAdmin.register Marca do
	
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Producto", label: "Marca"
 permit_params :marca_descrip, :marca_active, :created_at, :updated_at

scope :inactivo
scope :activo
scope :todos

filter :marca_descrip
filter :marca_active

index do
	column "Descripcion", :marca_descrip
	column "Activo", :marca_active
	column "Creado", :created_at
	actions
end

form title: 'Marcas' do |f|
    inputs 'Detalles' do
      input :marca_descrip, label: "Descripcion"
      input :marca_active, label: "Activo"
    end

    para "Presione cancelar para regresar a la lista sin guardar los cambios"
    actions
  	end

end
