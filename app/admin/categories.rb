ActiveAdmin.register Category do
menu parent: "Producto", label: "Categoria"

# Es necesario para poder guardar/editar datos desde el formulario
permit_params :category_descrip, :category_active

# Link para activar registro
action_item :activado, only: :show do
	link_to "Activar", activado_admin_category_path(category), method: :put if !category.category_active
end
# Funcion para activar registro
member_action :activado, method: :put do
category = Category.find(params[:id])
category.update(category_active: true)
redirect_to admin_categories_path
end

controller do
	def destroy
		category = Category.find(params[:id])
		category.update_attribute(:category_active, false)
		redirect_to admin_categories_path
	end
end

action_item :view, only: :show do
	link_to 'Atras', admin_categories_path
end

scope :inactivo
scope :activo, :default => true
scope :todos

# Filtros de busqueda
filter :category_descrip

# Vista de tabla principal
index title: "Categorias" do
	column "Descripcion", :category_descrip
	column "Activo", :category_active
	column "Creado", :created_at
	actions dropdown: true do |client|
		#link_to("Mostrar", admin_barrio_path(client)) + " | " + \
		#link_to("Editar", edit_admin_barrio_path(client)) + " | " + \
		#link_to("Eliminar", admin_barrio_path(client), :method => :delete, :confirm => "Are you sure?")
	end
end

#formulario personalizado
form title: 'Categorias' do |f|
    inputs 'Detalles' do
      input :category_descrip, label: "Descripcion"
    end
  	actions
  	end

		# Vista show
		 show title: "Categoria"  do
		   attributes_table do
		     row :category_descrip
		     row :category_active
		     row :created_at
		   end
		 end

end
