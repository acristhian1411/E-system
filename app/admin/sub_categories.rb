ActiveAdmin.register SubCategory do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Producto", label: " Sub Categorias"
permit_params :subcat_descrip, :subcat_active, :category_id


# Link para desactivar registro
action_item :desactivado, only: :show do
  link_to "Desactivar", desactivado_admin_sub_category_path(sub_category), method: :put if sub_category.subcat_active
end
# Funcion para desactivar registro
member_action :desactivado, method: :put do
sub_category = SubCategory.find(params[:id])
sub_category.update(subcat_active: false)
redirect_to admin_sub_category_path(sub_category)
end

# Link para activar registro
action_item :activado, only: :show do
  link_to "Activar", activado_admin_sub_category_path(sub_category), method: :put if !sub_category.subcat_active
end
# Funcion para activar registro
member_action :activado, method: :put do
sub_category = SubCategory.find(params[:id])
sub_category.update(subcat_active: true)
redirect_to admin_sub_category_index_path(sub_category)
end

scope :inactivo
scope :activo
scope :todos

# Filtros de busqueda
filter :subcat_descrip, label: "Descripcion"
filter :category

# Vista de tabla principal
index title: "Sub Categorias" do
	column "Descripcion", :subcat_descrip
	column "Activo", :subcat_active
  #column "category", :category["category_descrip"]
  column(:categoria) { |payment| payment.category.category_descrip }
	column "Creado", :created_at
  actions
#  column do
#  link_to 'Editar', admin_sub_categories_path(sub_categories) , method: :post
# end
end

# Formulario personalizado
form title: 'Sub Categorias' do |f|
    inputs 'Detalles' do
      input :subcat_descrip, label: "Descripcion"
      input :category_id,  label: "Categorias", :as => :select, :collection => Category.all.map{|a|["#{a.category_descrip}", a.id]}
      input :subcat_active, label: "Activo"
    end
    actions
  	end

  # Vista show
   show title: "Sub Categoria"  do
     attributes_table do
       row :subcat_descrip
       row :subcat_active
       row(:categoria) { |payment| payment.category.category_descrip }
       row :created_at
     end
   end

end
