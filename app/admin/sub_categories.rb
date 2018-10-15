ActiveAdmin.register SubCategory do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Producto", label: " Sub Categoria"

permit_params :subcat_descrip, :subcat_active, :category_id

action_item :desactivado, only: :show do
  link_to "Desactivar", desactivado_admin_sub_category_path(sub_category), method: :put
end

member_action :desactivado, method: :put do
sub_category = SubCategory.find(params[:id])
sub_category.update(subcat_active: false)
redirect_to admin_sub_category_path(sub_category)
end

scope :inactivo
scope :activo
scope :todos


index do
	column "Descripcion", :subcat_descrip
	column "Activo", :subcat_active
	column "Categorias", :category
	column "Creado", :created_at
	actions
end

form title: 'Sub Categorias' do |f|
    inputs 'Detalles' do
      input :subcat_descrip, label: "Descripcion"
      input :category_id,  label: "Categorias", :as => :select, :collection => Category.all.map{|a|["#{a.category_descrip}", a.id]}
      input :subcat_active, label: "Activo"
    end

    para "Presione cancelar para regresar a la lista sin guardar los cambios"
    actions
  	end


end
