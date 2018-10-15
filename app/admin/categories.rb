ActiveAdmin.register Category do
menu parent: "Producto", label: "Categoria"

# Es necesario para poder guardar/editar datos desde el formulario
permit_params :category_descrip, :category_active, :created_at, :updated_at


scope :inactivo
scope :activo
scope :todos

filter :category_descrip  
filter :category_active

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


    para "Presione cancelar para regresar a la lista sin guardar los cambios"
    actions

  	end
end
