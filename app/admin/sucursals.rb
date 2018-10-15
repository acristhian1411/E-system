ActiveAdmin.register Sucursal do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Stock", label: "Sucursales"
permit_params :suc_descrip, :suc_active

 scope :inactivo
 scope :activo
 scope :todos

 filter :suc_descrip
	index title: "Sucursales" do
		column "Descripcion", :suc_descrip
		column "Activo", :suc_active
		actions
	end
end
