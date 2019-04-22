    ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }



  content title: proc{ I18n.t("active_admin.dashboard") } do
#    div class: "blank_slate_container", id: "dashboard_default_message" do
#      span class: "blank_slate" do
#        span I18n.t("active_admin.dashboard_welcome.welcome")
#        small I18n.t("active_admin.dashboard_welcome.call_to_action")



#      end
#    end

#section "Ventas recientes" do
#  table_for Venta.order("created_at desc").limit(5) do
#    column :num_factura
#  end
#end

    # Here is an example of a simple dashboard with columns and panels.
    #



     columns do
       column do
         panel "Ventas recientes" do
              table_for Venta.order("created_at desc").limit(5) do |venta|
                column :cliente do |venta|
                   venta.cliente.nombre
                end
                column :fecha
                column "Numero de factura" do |venta|
                  link_to "##{venta.num_factura}", admin_ventum_path(venta)
                end
                column :total do |venta|
                number_to_currency venta.venta_detalles_total
                end
              end
          end

       end

       column do
         panel "Compras recientes" do
                      table_for Compra.order("created_at desc").limit(5) do
                        column :proveedor do |compra|
                           compra.provider.razon_social
                        end
                        column "Numero de factura" do |compra|
                          link_to "##{compra.num_factura}", admin_compra_path(compra)
                        end
                        column :fecha_compra
                        column :total do |compra|
                           number_to_currency compra.compra_detalles_total
                        end
                      end
                  end
                end

       end
       columns do
         column do
           panel "Vencimiento de cuotas" do
             @cred = CreditoCliente.all
             @credito = CreditoCliente.joins(:cuota_clientes).where(cuota_clientes: {:credito_cliente_id => @cred.ids} && {:vencimiento => Date.today})
             #@cuota = CuotaCliente.where(:vencimiento => Date.today).order("created_at desc")
             #@credito = CreditoCliente.where(:ids => @cuota.ids)
                   table_for @credito do |cuota|
                       column :monto_cuota
                       column :cantidad_cuota
                    end #table_fors
#SELECT  credito_clientes.* FROM credito_clientes INNER JOIN cuota_clientes ON cuota_clientes.credito_cliente_id = credito_clientes.id WHERE cuota_clientes.credito_cliente_id = 1 LIMIT 2;

            end #panel
          end #column
        end #columns

  end #  content
end
