ActiveAdmin.register CabCaja do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cajas", label: "Apertura de caja"
 permit_params :fecha_apertura, :fecha_cierre, :fecha_transaccion, :num_comprobante, :tipo_mov, :monto, :estado, :cajas_id

#actions  :index, :show, :create
config.filters = false

#member_action :cerrar, method: :put do
#cab = CabCaja.find(params[:id])
#cab.update_attribute(estado: false)
#redirect_to show_admin_cab_cajas_path
#end

controller do
  def destroy
    barrio = CabCaja.find(params[:id])
    barrio.update_attribute(:estado, false)
    barrio.update_attribute(:fecha_cierre, Date.today)
    redirect_to admin_cab_caja_path
  end
end

scope :cerrado
scope :abierto, :default => true

index title: "Aperturas de cajas" do
  	column "Fecha de Apertura", :fecha_apertura
  	column "Fecha de Cierre", :fecha_cierre
    #column(:caja) { |cab_caja| cab_caja.caja.created_at }
    column "Estado" do |i|
      if !i.estado
        "Cerrado"
      else
        "Abierto"
      end
    end
    actions do |caja|
      link_to("Mostrar", admin_cab_caja_path(caja)) + " | " + \
      link_to("Cerrar caja", admin_cab_caja_path(caja), :method => :delete, :confirm => "Esta seguro?")


    end
end
    form title: "Abrir caja" do |f|
     inputs "Apertura" do
       f.input :fecha_apertura, label: "Fecha de Apertura"
       f.input :cajas_id,  label: "Cajas", :as => :select, :collection => Caja.all.map{|a|["#{a.descripcion}", a.id]}
       f.input :monto, label: "Monto"
       f.input :tipo_mov, :as=> :hidden, :input_html => { :value => "Apertura" }
     end

     f.actions
   end


   show  do
      panel "Caja" do
        attributes_table_for cab_caja do
        #  row("Caja") { |cab_caja| cab_caja.caja.descripcion }
          row("Fecha de apertura") { |cab_caja| cab_caja.fecha_apertura }
          row("Fecha de cierre") { cab_caja.fecha_cierre }
          row("Saldo") { cab_caja.monto }
        end
      end

      panel "Detalles" do
        table_for cab_caja.det_caja do |t|
          t.column("MOnto") { |det_caja| number_with_delimiter det_caja.monto_cuota }
          t.column("cuota") { |det_caja|  det_caja.cuota_cliente_id }
        #  t.column("Descripcion") { |venta_detalle| venta_detalle.producto.prod_descrip }
        #  t.column("Costo unitario") { |venta_detalle| number_to_currency venta_detalle.precio_venta }
        #  t.column("Descuento") { |v| number_to_currency v.total_descuento}

          tr do
            2.times { td "" }
        #    td "Total:", :style => "text-align:right; font-weight: bold;"
        #    td "#{number_to_currency(venta.total)}", :style => "font-weight: bold;"
          end
        end
      end
    end



end
