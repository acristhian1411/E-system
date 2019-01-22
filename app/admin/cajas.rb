ActiveAdmin.register Caja do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cajas", label: "Caja"

 permit_params :descripcion

 action_item :activado, only: :show do
   link_to "Activar", activado_admin_caja_path(caja), method: :put if !caja.activo
 end
 # Funcion para activar registro
 member_action :activado, method: :put do
 caja = Caja.find(params[:id])
 caja.update(activo: true)
 redirect_to admin_cajas_path
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
   link_to 'Atras', admin_compras_path
 end

 scope :inactivo
 scope :activo, :default => true
 scope :todos

 filter :descripcion

 index do
   column :descripcion
   actions
 end

 form do |f|
   f.input :descripcion
   f.actions
 end

end
