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

    filter :category_id,  :as => :select, :collection => Category.all.map{|a|["#{a.category_descrip}", a.id]},
    label: 'Categorias'

 filter :sub_category_id, :as => :select, :collection => SubCategory.all.map{|a|["#{a.subcat_descrip}", a.id]},
     label: 'Sub Categorias'

 filter :marca_id, :as => :select, :collection => Marca.all.map{|a|["#{a.marca_descrip}", a.id]},
     label: 'Marcas'

 filter :provider_id, :as => :select, :collection => Provider.all.map{|a|["#{a.razon_social}", a.id]},
     label: 'Proveedores'

# Vista de tabla principal
   index title: "Productos" do
   	column "Descripcion", :prod_descrip
   	column "Precio", :precio_venta
    column(:categoria) { |producto| producto.category.category_descrip }
    actions
   end

     # Formulario personalizado
     form title: 'Productos' do |f|
         inputs 'Detalles' do
           input :prod_descrip, label: "Descripcion"
           input :category_id,  label: "Categoria", :as => :select, :collection => Category.all.map{|a|["#{a.category_descrip}", a.id]}
           input :sub_category_id,  label: "Sub Categoria", :as => :select, :collection => SubCategory.all.map{|a|["#{a.subcat_descrip}", a.id]}
           input :marca_id,  label: "Marca", :as => :select, :collection => Marca.all.map{|a|["#{a.marca_descrip}", a.id]}
# select con buscador(implementar)
           input :provider_id,  label: "Proveedor", :as => :select2, :collection => Provider.all.map{|a|["#{a.razon_social}", a.id]}
           input :precio_venta, label: "Precio venta"
           input :iva, :as => :select,      :collection => [5, 10]
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


sidebar "Stock en Sucursales", :only => :show do
  table_for Stock.where(:producto_id => producto.id).limit(3).all do |t|
   t.column("Stock") { |stock|  stock.sucursal.suc_descrip }
   t.column("Cantidad") { |stock|  stock.cantidad }
  end
end

end
