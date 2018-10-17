ActiveAdmin.register Sucursal do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Stock", label: "Sucursales"
permit_params :suc_descrip, :suc_active

 scope :inactivo
 scope :activo
 scope :todos

# Filtros de busqueda
 filter :suc_descrip

	index title: "Sucursales" do
		column "Descripcion", :suc_descrip
		column "Activo", :suc_active
		actions
	end

  # Vista show
   show title: "Sucursal"  do
     attributes_table do
       row :suc_descrip
       row :suc_active
       row :created_at
     end
   end

end
