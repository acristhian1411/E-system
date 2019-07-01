ActiveAdmin.register Caja do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cajas", label: "Caja"

 permit_params :descripcion

 action_item :abrir, only: :show do
   link_to "Abrir caja", abrir_admin_caja_path(caja), method: :put
 end

 action_item :activado, only: :show do
   link_to "Activar", activado_admin_caja_path(caja), method: :put if !caja.activo
 end

 # Funcion para activar registro
 member_action :activado, method: :put do
 caja = Caja.find(params[:id])
 caja.update_attribute(:activo, true)
 redirect_to admin_cajas_path
 end

 # Funcion para abrir caja
 member_action :abrir, method: :put do
 #caja = CabCaja.find(params[:cajas_id])
 redirect_to new_admin_cab_caja_path
 end

 # Controlador personalizado para softDelete
 controller do

   def destroy
     caja = Caja.find(params[:id])
     caja.update_attribute(:activo, false)
     redirect_to admin_cajas_path
   end

 end

 # Boton atras en vista show
 action_item :view, only: :show do
   link_to 'Atras', admin_cajas_path
 end

 scope :inactivo
 scope :activo, :default => true
 scope :todos

 filter :descripcion

 index title: "Cajas" do |f|
   f.column :descripcion
   f.actions
 end

 form title: 'Cajas' do |f|
		 inputs 'Detalles' do
			 input :descripcion, label: "Descripción"
		 end
		 actions
		 end

 show title: "Caja"  do
   attributes_table do
     row :descripcion
     row("Creado") {caja.created_at}
   end
 end

end
