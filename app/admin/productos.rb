ActiveAdmin.register Producto do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

menu parent: "Producto", label: "Productos"
 permit_params :iva, :precio_venta, :prod_active, :prod_descrip, :category_id, :marca_id, :provider_id, :sub_category_id

 # Link para activar registro
 action_item :activado, only: :show do
   link_to "Activar", activado_admin_producto_path(producto), method: :put if !producto.prod_active
 end
 # Funcion para activar registro
 member_action :activado, method: :put do
 producto = Producto.find(params[:id])
 producto.update(prod_active: true)
 redirect_to admin_producto_path
 end

# Controlador personalizado para
 controller do
   def destroy
     producto = Producto.find(params[:id])
     producto.update_attribute(:prod_active, false)
     redirect_to admin_productos_path
   end
 end

# Boton atras en vista show
 action_item :view, only: :show do
   link_to 'Atras', admin_productos_path
 end

 scope :inactivo
 scope :activo, :default => true
 scope :todos

 # Filtros de busqueda
 filter :prod_descrip, label: "Descripcion"

 filter :category_id, collection: -> { Category.all },
    label: 'Categorias', :as => :select, :collection => Category.all.map{|a|["#{a.category_descrip}", a.id]}

 filter :sub_category_id, collection: -> { SubCategory.all },
     label: 'Sub Categorias', :as => :select, :collection => SubCategory.all.map{|a|["#{a.subcat_descrip}", a.id]}

 filter :marca_id, collection: -> { Marca.all },
     label: 'Marcas', :as => :select, :collection => Marca.all.map{|a|["#{a.marca_descrip}", a.id]}

 filter :provider_id, collection: -> { Provider.all },
     label: 'Proveedores', :as => :select, :collection => Provider.all.map{|a|["#{a.razon_social}", a.id]}

# Vista de tabla principal
   index title: "Productos" do
   	column "Descripcion", :prod_descrip
   	column "Precio", :precio_venta
    column(:categoria) { |payment| payment.category.category_descrip }
   	column "Creado", :created_at
    actions dropdown: true do |client|
      #link_to("Mostrar", admin_producto_path(client)) + " | " + \
      #link_to("Editar", edit_admin_producto_path(client)) + " | " + \
      #link_to("Eliminar", admin_producto_path(client), :method => :delete, :confirm => "Are you sure?")
    end
   end

     # Formulario personalizado
     form title: 'Productos' do |f|
         inputs 'Detalles' do
           input :prod_descrip, label: "Descripcion"
           input :category_id,  label: "Categoria", :as => :select, :collection => Category.all.map{|a|["#{a.category_descrip}", a.id]}
           input :sub_category_id,  label: "Sub Categoria", :as => :select, :collection => SubCategory.all.map{|a|["#{a.subcat_descrip}", a.id]}
           input :marca_id,  label: "Marca", :as => :select, :collection => Marca.all.map{|a|["#{a.marca_descrip}", a.id]}
           input :provider_id,  label: "Proveedor", :as => :select, :collection => Provider.all.map{|a|["#{a.razon_social}", a.id]}
           input :precio_venta, label: "Precio venta"
           input :iva, label: "Iva"
         end
         actions
       	end

      # Vista show
       show :title => :prod_descrip  do
         attributes_table do
           row :prod_descrip
           row(:categoria) { |payment| payment.category.category_descrip }
           row(:sub_categoria) { |payment| payment.sub_category.subcat_descrip }
           row(:marca) { |payment| payment.marca.marca_descrip }
           row(:proveedor) { |payment| payment.provider.razon_social }
           row :iva
           row :prod_active
           row :created_at
         end
       end

end
