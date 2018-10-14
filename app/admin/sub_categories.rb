ActiveAdmin.register SubCategory do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Category"
 permit_params :subcat_descrip, :subcat_active, :category_id
#


index do
	column "Descripcion", :subcat_descrip
	column "Activo", :subcat_active
	column "Categorias", :category_id
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
