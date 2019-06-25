ActiveAdmin.register CabCaja do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cajas", label: "Apertura de caja"
 permit_params :fecha_apertura, :fecha_cierre, :fecha_transaccion, :num_comprobante, :cajas_id

config.filters = false

index title: "Aperturas de cajas" do


  	column "Fecha de Apertura", :fecha_apertura
  	column "Fecha de Cierre", :fecha_cierre
    #column "category", :category["category_descrip"]
    #column(:caja) { |payment| payment.cajas.descripcion }
  	column "Creado", :created_at
    actions do |client|
      #link_to("Mostrar", admin_sub_category_path(client)) + " | " + \
      #link_to("Editar", edit_admin_sub_category_path(client)) + " | " + \
      #link_to("Eliminar", admin_sub_category_path(client), :method => :delete, :confirm => "Are you sure?")
    end
end
    form do |f|
     inputs "Apertura" do
       f.input :fecha_apertura, label: "Fecha de Apertura"
     end
     
     f.actions
   end



end
