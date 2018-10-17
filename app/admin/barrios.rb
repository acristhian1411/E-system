ActiveAdmin.register Barrio do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cliente", label: " Barrios"
# Campos permitidos para formulario
 permit_params :descripcion,  :activo

# lista segun activo o no
 scope :inactivo
 scope :activo
 scope :todos

# filtros de busqueda
 filter :descripcion

# tabla de index
 index title: "Barrios" do
 	 column "Descripcion", :descripcion
	 column "Creado", :created_at
   actions
 end

# Vista show
 show title: "Barrio"  do
   attributes_table do
     row :descripcion
     row :activo
     row :created_at
   end
 end


end
