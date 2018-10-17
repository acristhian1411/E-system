ActiveAdmin.register Ciudade do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cliente", label: "Ciudades"
# Campos permitidos para formulario
permit_params :descripcion,  :activo

# lista segun activo o no
 scope :inactivo
 scope :activo
 scope :todos

# filtros de busqueda
  filter :descripcion

# tabla de index
 index title: "Ciudades" do
 	 column "Descripcion", :descripcion
	 column "Creado", :created_at
   actions
 end

# Vista show
 show title: "Ciudad"  do
   attributes_table do
     row :descripcion
     row :activo
     row :created_at
   end
 end

end
