ActiveAdmin.register Venta do
menu parent: "Ventas", label: " Venta"

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

permit_params :cliente_id, :admin_user_id, :sucursal_id, :num_factura, :forma_pago, :fecha, venta_detalle_attributes:[:id, :producto_id, :monto_desc, :porcent_desc, :cantidad, :precio_venta]


# Controlador personalizado para softDelete
controller do

  def destroy
    venta = Venta.find(params[:id])
    venta.update_attribute(:activo, false)
    redirect_to admin_venta_path
  end

#  def create
#    respond_to do |format|
#      if @venta.save || @venta.forma_pago == true
#        format.html { redirect_to, notice: 'Cliente fue creado con éxito.'}
#        format.json { render :show, status: :created, location: @cliente }
#      else
#        format.html { render :new }
#        format.json { render json: @cliente.errors, status: :unprocessable_entity }
#      end
#    end
#  end

end

# Boton atras en vista show
action_item :view, only: :show do
  link_to 'Atras', admin_venta_path
end

scope :inactivo
scope :activo, :default => true
scope :todos


index do
   index_column
   column :cliente do |venta|
      venta.cliente.nombre
   end
   column(:apellido) { |venta| venta.cliente.apellido }
   column("Sucursal") { |venta| venta.sucursal.suc_descrip }
   column("Fecha de venta") { |venta| venta.fecha }
   column("Forma de pago") { |venta| venta.forma_pago }
   column :total do |venta|
     number_to_currency venta.total
   end
actions
end


form do |f|
   f.input :cliente_id,  label: "Cliente", :as => :select, :collection => Cliente.activo.map{|a|["#{a.nombre || a.apellido}", a.id]}
   f.input :admin_user_id, label: "Usuario", :hint => "El usuario sugerido es #{Venta.usuario(current_admin_user)}", :as => :select, :collection => AdminUser.all.map{|a|["#{a.email}", a.id]}
   f.input :sucursal_id, label: "Sucursal", :as => :select, :collection => Sucursal.activo.map{|a|["#{a.suc_descrip}", a.id]}
   f.input :num_factura, label: "Numero de comprobante"
   f.input :fecha, label: "Fecha de compra"
   f.input :forma_pago, label: "Forma de pago", :as => :radio, :collection => ["Contado", "Credito"]
 f.inputs "Detalles" do
   f.has_many :venta_detalle do |i|
     i.input :producto_id,  label: "Producto", :hint => "Elija un producto", :as => :select, :collection => Producto.activo.map{|a|["#{a.prod_descrip}", a.id]}
     i.input :cantidad, :hint => "Ingrese la cantidad"
     i.input :precio_venta, label: "Precio de venta"
     #, :as =>  Producto.precio(:producto_id)
     i.input :monto_desc, label: "Descuento",  label: "Descuento", :hint => "Ingrese el descuento"
     i.input :porcent_desc, label: "Descuento", :hint => "Ingrese el % de descuento"
   end
 end
 f.actions
end

show  do
   panel "Invoice Details" do
     attributes_table_for venta do
       row("Cliente") { |payment| payment.cliente.nombre }
       row("Usuario") { |payment| payment.admin_user.email }
       row("Numero de factura") { venta.num_factura }
       row("Forma de pago") { venta.forma_pago }
       row("Fecha de venta") { venta.fecha }
     end
   end

   panel "Items" do
     table_for venta.venta_detalle do |t|
       t.column("Cantidad") { |venta_detalle| number_with_delimiter venta_detalle.cantidad }
       t.column("Descripcion") { |venta_detalle| venta_detalle.producto.prod_descrip }
       t.column("Costo unitario") { |venta_detalle| number_to_currency venta_detalle.precio_venta }
       t.column("Descuento") { |v| number_to_currency v.total_descuento}

       tr do
         2.times { td "" }
         td "Total:", :style => "text-align:right; font-weight: bold;"
         td "#{number_to_currency(venta.total)}", :style => "font-weight: bold;"
       end
     end
   end
 end

end
