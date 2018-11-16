ActiveAdmin.register SubCategory do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Producto", label: " Sub Categorias"
permit_params :subcat_descrip, :subcat_active, :category_id

controller do
  def destroy
    cliente = SubCategory.find(params[:id])
    cliente.update_attribute(:subcat_active, false)
    redirect_to admin_sub_categories_path
  end
end

action_item :view, only: :show do
  link_to 'Atras', admin_sub_categories_path
end

# Link para activar registro
action_item :activado, only: :show do
  link_to "Activar", activado_admin_sub_category_path(sub_category), method: :put if !sub_category.subcat_active
end
# Funcion para activar registro
member_action :activado, method: :put do
sub_category = SubCategory.find(params[:id])
sub_category.update(subcat_active: true)
redirect_to admin_sub_categories_path
end

scope :inactivo
scope :activo, :default => true
scope :todos

# Filtros de busqueda
filter :subcat_descrip, label: "Descripcion"
filter :category_id, collection: -> { Category.all },
   label: 'Categorias', :as => :select, :collection => Category.all.map{|a|["#{a.category_descrip}", a.id]}

# Vista de tabla principal
index title: "Sub Categorias" do
	column "Descripcion", :subcat_descrip
	column "Activo", :subcat_active
  #column "category", :category["category_descrip"]
  column(:categoria) { |payment| payment.category.category_descrip }
	column "Creado", :created_at
  actions do |client|
    #link_to("Mostrar", admin_sub_category_path(client)) + " | " + \
    #link_to("Editar", edit_admin_sub_category_path(client)) + " | " + \
    #link_to("Eliminar", admin_sub_category_path(client), :method => :delete, :confirm => "Are you sure?")
  end
end

# Formulario personalizado
form title: 'Sub Categorias' do |f|
    inputs 'Detalles' do
      input :subcat_descrip, label: "Descripcion"
      input :category_id,  label: "Categorias", :as => :select, :collection => Category.all.map{|a|["#{a.category_descrip}", a.id]}
    end
    actions
  	end

  # Vista show
   show :title => :subcat_descrip  do
     attributes_table do
       row :subcat_descrip
       row :subcat_active
       row(:categoria) { |payment| payment.category.category_descrip }
       row :created_at
     end
   end

end
