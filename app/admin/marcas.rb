ActiveAdmin.register Marca do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Producto", label: "Marcas"
 permit_params :marca_descrip, :marca_active, :created_at, :updated_at

 controller do
   def destroy
     marca = Marca.find(params[:id])
     marca.update_attribute(:marca_active, false)
     redirect_to admin_marcas_path
   end
 end

 action_item :view, only: :show do
   link_to 'Atras', admin_marcas_path
 end

 # Link para activar registro
 action_item :activado, only: :show do
   link_to "Activar", activado_admin_marca_path(marca), method: :put if !marca.marca_active
 end
 # Funcion para activar registro
 member_action :activado, method: :put do
 marca = Marca.find(params[:id])
 marca.update(marca_active: true)
 redirect_to admin_marcas_path
 end

# lista segun activo o no
scope :inactivo
scope :activo, :default => true
scope :todos

# Filtros de busqueda
filter :marca_descrip, label: "Descripcion"

# Vista principal de la tabla
index title: "Marcas" do
	column "Descripcion", :marca_descrip
	column "Creado", :created_at
  column do |client|
    link_to("Mostrar", admin_marca_path(client)) + " | " + \
    link_to("Editar", edit_admin_marca_path(client)) + " | " + \
    link_to("Eliminar", admin_marca_path(client), :method => :delete, :confirm => "Are you sure?")
  end
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
