ActiveAdmin.register Traslado do

	menu parent: "Stock", label: "Traslado"
 	permit_params :sucursal_origen, :sucursal_destino, :fecha, :admin_user_id, traslado_detalles_attributes:[:id, :producto_id, :cantidad]

# INICIO

index do
	column("Motivo de traslado") { |traslado| traslado.motivo }
	column("Fecha de traslado") { |traslado| traslado.fecha }
	column("Numero de comprobante") { |traslado| traslado.num_comprobante }

	actions
end

# FORMULARIO

form do |f|
		f.input :admin_user_id, label: "Usuario", :as => :select, :collection => AdminUser.all.map{|a|["#{a.email}", a.id]}
		f.input :sucursal_origen, label: "Sucursal de origen", :as => :select, :collection => Sucursal.all.map{|b|["#{b.suc_descrip}", b.id]}
    f.input :sucursal_destino, label: "Sucursal de destino", :as => :select, :collection => Sucursal.all.map{|a|["#{a.suc_descrip}", a.id]}
    f.input :num_comprobante, label: "Numero de Comprobante"
    f.input :fecha, label: "Fecha de traslado"
  f.inputs "Detalles" do
    f.has_many :traslado_detalles do |i|
      i.input :producto_id,  label: "Producto", :as => :select, :collection => Producto.all.map{|a|["#{a.prod_descrip}", a.id]}
      i.input :cantidad
    end
  end
  f.actions
end

# SHOW

show  do
    panel "Traslado" do
      attributes_table_for traslado do
				row("Usuario") { |traslado| traslado.admin_user.email }
				#row("Sucursal de origen") { Sucursal.suc_descrip }
				#row("Usuario") { |payment| payment.sucursal.suc_descrip }
				row("Sucursal de destino") { |traslado| traslado.sucursal.suc_descrip }
        row("Numero de comprobante") { traslado.num_comprobante }
        row("Fecha de traslado") { traslado.fecha }
      end
    end

    panel "Productos" do
      table_for traslado.traslado_detalles do |t|
        t.column("Cantidad") { |compra_detalles| number_with_delimiter compra_detalles.cantidad }
        t.column("Descripcion") { |compra_detalles| compra_detalles.producto.prod_descrip }

      end
    end
  end

end
