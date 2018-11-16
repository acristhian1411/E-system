ActiveAdmin.register Ciudade do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cliente", label: "Ciudades"
# Campos permitidos para formulario
permit_params :descripcion,  :activo

# Link para activar registro
action_item :activado, only: :show do
	link_to "Activar", activado_admin_ciudade_path(ciudade), method: :put if !ciudade.activo
end
# Funcion para activar registro
member_action :activado, method: :put do
category = Ciudade.find(params[:id])
category.update(activo: true)
redirect_to admin_ciudades_path
end

controller do
	def destroy
		category = Ciudade.find(params[:id])
		category.update_attribute(:activo, false)
		redirect_to admin_ciudades_path
	end
end

action_item :view, only: :show do
	link_to 'Atras', admin_ciudades_path
end

# lista segun activo o no
 scope :inactivo
 scope :activo, :default => true
 scope :todos

# filtros de busqueda
  filter :descripcion

# tabla de index
 index title: "Ciudades" do
 	 column "Descripcion", :descripcion
	 column "Creado", :created_at
   actions  do |client|
     #link_to("Mostrar", admin_ciudade_path(client)) + " | " + \
     #link_to("Editar", edit_admin_ciudade_path(client)) + " | " + \
     #link_to("Eliminar", admin_ciudade_path(client), :method => :delete, :confirm => "Are you sure?")
   end
 end

 form title: 'Ciudades' do |f|
		 inputs 'Detalles' do
			 input :descripcion, label: "Descripcion"
		 end
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
