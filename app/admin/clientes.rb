ActiveAdmin.register Cliente do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Ventas", label: "Clientes"
 permit_params :nombre, :n_cedula, :direccion, :cli_telefono, :limite_credito, :activo, :ciudade_id, :barrio_id

controller do
  def destroy
    cliente = Cliente.find(params[:id])
    cliente.update_attribute(:activo, false)
    redirect_to admin_clientes_path
  end
end

action_item :view, only: :show do
  link_to 'Atras', admin_clientes_path
end

# Link para activar registro
action_item :activado, only: :show do
  link_to "Activar", activado_admin_cliente_path(cliente), method: :put if !cliente.activo
end
# Funcion para activar registro
member_action :activado, method: :put do
sub_category = Cliente.find(params[:id])
sub_category.update(activo: true)
redirect_to admin_clientes_path
end

 # lista segun activo o no
 scope :inactivo
 scope :activo, :default => true
 scope :todos

 filter :nombre, label: "Nombre y apellido"
 filter :n_cedula, label: "N° de Cedula"
 filter :direccion
 filter :ciudade_id,  :as => :select, :collection => Ciudade.activo.map{|a|["#{a.descripcion}", a.id]},
 label: 'Ciudad'
 filter :barrio_id,  :as => :select, :collection => Barrio.activo.map{|a|["#{a.descripcion}", a.id]},
 label: 'Barrio'

# tabla en index
 index title: "Clientes" do
     column :nombre
   column :n_cedula
  	column :cli_telefono
     column :direccion
     actions

 end

# Formulario personalizado
form title: 'Clientes' do |f|
    inputs 'Detalles' do
      input :nombre, label: "Nombre y Apellido"
      input :n_cedula, label: "Num de Cedula"
      input :direccion, label: "Direccion"
      input :cli_telefono, label: "Num de telefono"
      input :limite_credito, label: "Limite de credito"
      input :ciudade_id,  label: "Ciudad", :as => :select, :collection => Ciudade.activo.map{|a|["#{a.descripcion}", a.id]}
      input :barrio_id,  label: "Barrio", :as => :select, :collection => Barrio.activo.map{|a|["#{a.descripcion}", a.id]}
    end
      actions do
        button 'Guardar'
      end
    end


  show :title => :nombre do
    panel "Client Details" do
      attributes_table_for cliente do
        row("Nombre") { cliente.nombre }
        row("Cedula") { cliente.n_cedula }
        row("Telefono") { cliente.cli_telefono }
        row("Direccion") { cliente.direccion }
        row(:ciudad) { |payment| payment.ciudade.descripcion }
        row(:barrio) { |payment| payment.barrio.descripcion }
      end
    end
  end

  sidebar "Ultimas ventas", :only => :show do
    table_for Venta.where(:cliente_id => cliente.id).order('created_at desc').limit(5).all do |t|
      t.column("Forma de pago") { |venta| venta.forma_pago }
      t.column("Comprobante") { |venta| link_to "##{venta.num_factura}", admin_ventum_path(venta) }
      t.column("Total") { |venta| number_to_currency venta.venta_detalles_total }
    end
  end

  sidebar "Saldo", :only => :show do
    @credito = CreditoCliente.where(:cliente_id => cliente.id).order('created_at desc').all
#    panel "Credito" do
#      table_for @credito do |t|
#        t.column("Comprobante")   do |credito|
#          credito.venta.num_factura
#        end
#        t.column("Fecha de compra") { |credito| credito.venta.fecha }
#      end
#    end
#    panel "Cuotas" do
      table_for CuotaCliente.where(:credito_cliente_id => @credito.ids).order('vencimiento asc') do |t|
        t.column("Cuota")  do |cuota|
            cuota.saldo_cuota
        end
        t.column("Vencimiento") { |cuota| cuota.vencimiento }
      end
#    end

  end

  sidebar "Total Vendido", :only => :show do
    h2 number_to_currency(Venta.where(:cliente_id => cliente.id).all.sum(&:total)), :style => "text-align: center; margin-top: 20px;"
  end

end
