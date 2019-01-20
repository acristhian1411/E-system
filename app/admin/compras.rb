ActiveAdmin.register Compra do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :provider_id, :admin_user_id, :num_factura, :fecha_compra, compra_detalles_attributes:[:id, :producto_id, :descuento, :porcent_desc, :cantidad, :precio_compra]

 action_item :activado, only: :show do
   link_to "Activar", activado_admin_compra_path(compra), method: :put if !compra.activo
 end
 # Funcion para activar registro
 member_action :activado, method: :put do
 compra = Compra.find(params[:id])
 compra.update(activo: true)
 redirect_to admin_compra_path
 end

# Controlador personalizado para softDelete
 controller do

   def destroy
     compra = Compra.find(params[:id])
     compra.update_attribute(:activo, false)
     redirect_to admin_compras_path
   end

 end

# Boton atras en vista show
 action_item :view, only: :show do
   link_to 'Atras', admin_compras_path
 end

 scope :inactivo
 scope :activo, :default => true
 scope :todos


index do
  column(:proveedor) { |compra| compra.provider.razon_social }

  column("Fecha de compra") { |compra| compra.fecha_compra }
  column :total do |compra|
  number_to_currency compra.total
end

actions
end


form do |f|
    f.input :provider_id,  label: "Proveedor", :as => :select, :collection => Provider.activo.map{|a|["#{a.razon_social}", a.id]}
    f.input :admin_user_id, label: "Usuario", :hint => Compra.usuario(current_admin_user), :as => :select, :collection => AdminUser.all.map{|a|["#{a.email}", a.id]}

    f.input :num_factura, label: "Numero de factura"
    f.input :fecha_compra, label: "Fecha de compra"
  f.inputs "Detalles" do
    f.has_many :compra_detalles do |i|
      i.input :producto_id,  label: "Producto", :as => :select, :collection => Producto.activo.map{|a|["#{a.prod_descrip}", a.id]}
      i.input :cantidad
      i.input :precio_compra, label: "Precio de compra"
      i.input :descuento, :hint => "Ingrese el descuento"
      i.input :porcent_desc, :hint => "Ingrese el % de descuento"
    end
  end
  f.actions
end

show  do
    panel "Invoice Details" do
      attributes_table_for compra do
        row("Proveedor") { |payment| payment.provider.razon_social }
        row("Usuario") { |payment| payment.admin_user.email }
        row("Numero de factura") { compra.num_factura }
        row("Fecha de compra") { compra.fecha_compra }
      end
    end

    panel "Items" do
      table_for compra.compra_detalles do |t|
        t.column("Cantidad") { |compra_detalles| number_with_delimiter compra_detalles.cantidad }
        t.column("Descripcion") { |compra_detalles| compra_detalles.producto.prod_descrip }
        t.column("Costo unitario") { |compra_detalles| number_to_currency compra_detalles.precio_compra }
        t.column("Descuento") { |compra_detalles| number_to_currency compra_detalles.total_descuento}

        tr do
          2.times { td "" }
          td "Total:", :style => "text-align:right; font-weight: bold;"
          td "#{number_to_currency(compra.total)}", :style => "font-weight: bold;"
        end
      end
    end
  end


end
