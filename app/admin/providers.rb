ActiveAdmin.register Provider do
	menu parent: "Producto", label: "Proveedores"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :razon_social, :ruc, :prov_direccion, :telefono, :email, :prov_active

 filter :razon_social
 filter :ruc

 scope :inactivo
 scope :activo
 scope :todos

 index title: "Proveedores" do
 	column "Razon social", :razon_social
 	column :ruc
 	column "Direccion", :prov_direccion
 	column :telefono
 	column :email
 	actions
 end

  show title: "Proveedores" do
    attributes_table do
      row :razon_social
      row :ruc
      row :prov_direccion
      row :telefono
      row :email


    end
  end

end
