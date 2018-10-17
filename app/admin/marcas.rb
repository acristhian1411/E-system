ActiveAdmin.register Marca do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Producto", label: "Marcas"
 permit_params :marca_descrip, :marca_active, :created_at, :updated_at

# lista segun activo o no
scope :inactivo
scope :activo
scope :todos

# Filtros de busqueda
filter :marca_descrip

# Vista principal de la tabla
index title: "Marcas" do
	column "Descripcion", :marca_descrip
	column "Activo", :marca_active
	column "Creado", :created_at
	actions
end

# Formulario personalizado
form title: 'Marcas' do |f|
    inputs 'Detalles' do
      input :marca_descrip, label: "Descripcion"
      input :marca_active, label: "Activo"
    end
    actions
  	end
# Vista show
	 show title: "Marca"  do
	   attributes_table do
	     row :marca_descrip
	     row :marca_active
	     row :created_at
	   end
	 end

end
