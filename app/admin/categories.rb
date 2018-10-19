ActiveAdmin.register Category do
menu parent: "Producto", label: "Categoria"
#has_many :sub_category
# Es necesario para poder guardar/editar datos desde el formulario
permit_params :category_descrip, :category_active


scope :inactivo
scope :activo
scope :todos

# Filtros de busqueda
filter :category_descrip

# Vista de tabla principal
index title: "Categorias" do
	column "Descripcion", :category_descrip
	column "Activo", :category_active
	column "Creado", :created_at
	actions
end

#formulario personalizado
form title: 'Categorias' do |f|
    inputs 'Detalles' do
      input :category_descrip, label: "Descripcion"
      input :category_active, label: "Activo"
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
