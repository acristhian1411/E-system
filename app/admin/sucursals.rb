ActiveAdmin.register Sucursal do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Stock", label: "Sucursales"
permit_params :suc_descrip, :suc_active

controller do
  def destroy
    sucursal = Sucursal.find(params[:id])
    sucursal.update_attribute(:suc_active, false)
    redirect_to admin_sucursals_path
  end
end

action_item :view, only: :show do
  link_to 'Atras', admin_sucursals_path
end

# Link para activar registro
action_item :activado, only: :show do
  link_to "Activar", activado_admin_sucursal_path(sucursal), method: :put if !sucursal.suc_active
end
# Funcion para activar registro
member_action :activado, method: :put do
sub_category = Sucursal.find(params[:id])
sub_category.update(suc_active: true)
redirect_to admin_sucursals_path
end

 scope :inactivo
 scope :activo, :default => true
 scope :todos

# Filtros de busqueda
 filter :suc_descrip, label: "Descripcion"

	index title: "Sucursales" do
		column "Descripcion", :suc_descrip
		column "Activo", :suc_active
    actions dropdown: true do |client|
      #link_to("Mostrar", admin_sucursal_path(client)) + " | " + \
      #link_to("Editar", edit_admin_sucursal_path(client)) + " | " + \
      #link_to("Eliminar", admin_sucursal_path(client), :method => :delete, :confirm => "Are you sure?")
    end
	end

  form title: 'Barrios' do |f|
      inputs 'Detalles' do
        input :suc_descrip, label: "Descripcion"
      end
      actions
     end

  # Vista show
   show :title => :suc_descrip  do
     attributes_table do
       row :suc_descrip
       row :suc_active
       row :created_at
     end
   end

end
