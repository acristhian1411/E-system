ActiveAdmin.register Provider do
	menu parent: "Compras", label: " Proveedor"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
 permit_params :razon_social, :ruc, :prov_direccion, :telefono, :email, :prov_active

 controller do
   def destroy
     proveedor = Provider.find(params[:id])
     proveedor.update_attribute(:prov_active, false)
     redirect_to admin_providers_path
   end
 end

 action_item :view, only: :show do
   link_to 'Atras', admin_providers_path
 end

 # Link para activar registro
 action_item :activado, only: :show do
   link_to "Activar", activado_admin_provider_path(provider), method: :put if !provider.prov_active
 end
 # Funcion para activar registro
 member_action :activado, method: :put do
 proveedor = Provider.find(params[:id])
 proveedor.update(prov_active: true)
 redirect_to admin_providers_path
 end


 filter :razon_social
 filter :ruc

 scope :inactivo
 scope :activo, :default => true
 scope :todos

 index title: "Proveedores" do
 	column "Razon social", :razon_social
 	column :ruc
 	column "Direccion", :prov_direccion
 	column :telefono
 	column :email
	actions  do |client|
		#link_to("Mostrar", admin_provider_path(client)) + " | " + \
		#link_to("Editar", edit_admin_provider_path(client)) + " | " + \
		#link_to("Eliminar", admin_provider_path(client), :method => :delete, :confirm => "Are you sure?")
	end
 end

 # Formulario personalizado
 form title: 'Proveedores' do |f|
     inputs 'Detalles' do
       input :razon_social, label: "Razon Social"
       input :ruc, label: "Num de Ruc"
			 input :telefono, label: "Num de telefono"
       input :prov_direccion, label: "Direccion"
       input :email, label: "Correo electronico"
     end
       actions do
         button 'Guardar'
       end
     end

  show title: "Proveedores" do
    attributes_table_for provider do
      row :razon_social
      row :ruc
      row ("direccion") {provider.prov_direccion}
      row :telefono
      row :email
    end
  end

end
