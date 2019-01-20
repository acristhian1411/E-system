ActiveAdmin.register Traslado do

	menu parent: "Stock", label: "Traslado"
 	permit_params :sucursal_origen, :sucursal_destino, :num_comprobante, :motivo, :fecha, :admin_user_id, traslado_detalles_attributes:[:id, :producto_id, :cantidad]

	action_item :activado, only: :show do
		link_to "Activar", activado_admin_traslado_path(traslado), method: :put if !traslado.activo
	end
	# Funcion para activar registro
	member_action :activado, method: :put do
	compra = Traslado.find(params[:id])
	compra.update(activo: true)
	redirect_to admin_traslados_path
	end

	# Controlador personalizado para softDelete
	controller do

		def destroy
			traslado = Traslado.find(params[:id])
			traslado.update_attribute(:activo, false)
			redirect_to admin_traslados_path
		end

	end

	# Boton atras en vista show
	action_item :view, only: :show do
		link_to 'Atras', admin_compras_path
	end

	scope :inactivo
	scope :activo, :default => true
	scope :todos

	filter :motivo
	filter :admin_user_id,  :as => :select, :collection => AdminUser.all.map{|a|["#{a.email}", a.id]},
	label: 'Usuarios'
	filter :sucursal_origen,  :as => :select, :collection => Sucursal.activo.map{|a|["#{a.suc_descrip}", a.id]},
	label: 'Sucursal de origen'
	filter :sucursal_destino,  :as => :select, :collection => Sucursal.all.map{|a|["#{a.suc_descrip}", a.id]},
	label: 'Sucursal de destino'
	filter :fecha, label: 'Sucursal de origen'

# INICIO
index do
	column("Motivo de traslado") { |traslado| traslado.motivo }
	column("Fecha de traslado") { |traslado| traslado.fecha }
	column("Numero de comprobante") { |traslado| traslado.num_comprobante }
	actions
end

# FORMULARIO
form do |f|
		f.input :admin_user_id, label: "Usuario", :hint => Traslado.usuario(current_admin_user), :as => :select, :collection => AdminUser.all.map{|a|["#{a.email}", a.id]}
		f.input :sucursal_origen, label: "Sucursal de origen", :as => :select, :collection => Sucursal.activo.map{|b|["#{b.suc_descrip}", b.id]}
		f.input :sucursal_destino, label: "Sucursal de destino", :as => :select, :collection => Sucursal.activo.map{|a|["#{a.suc_descrip}", a.id]}
    f.input :motivo, label: "Motivo del traslado"
	  f.input :num_comprobante, :hint => "N° Comprobante"
    f.input :fecha, label: "Fecha de traslado"
  f.inputs "Detalles" do
    f.has_many :traslado_detalles do |i|
      i.input :producto_id,  label: "Producto", :as => :select, :collection => Producto.activo.map{|a|["#{a.prod_descrip}", a.id]}
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
				row("Sucursal de origen") { Traslado.sucursal(traslado.sucursal_origen) }
				row("Sucursal de destino") { Traslado.sucursal(traslado.sucursal_destino) }

        row("N° Comprobante") { traslado.num_comprobante }
        row("Fecha de traslado") { traslado.fecha }
      end
    end

    panel "Productos" do
      table_for traslado.traslado_detalles do |t|
        t.column("Cantidad") { |traslado_detalles| number_with_delimiter traslado_detalles.cantidad }
        t.column("Descripcion") { |traslado_detalles| traslado_detalles.producto.prod_descrip }

      end
    end
  end

end
