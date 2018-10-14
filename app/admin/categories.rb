ActiveAdmin.register Category do
	 menu label: "Categoria"


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

# Es necesario para poder guardar/editar datos desde el formulario
 permit_params :category_descrip, :category_active, :created_at, :updated_at


=begin 
barra de ayuda costado derecho
 sidebar :Ayuda do
   ul do
    li "Second List First Item"
    li "Second List Second Item"
   end
 end
fin de barra de ayuda
=end

scope :inactivo
scope :activo

filter :category_descrip
filter :category_active

index do
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
