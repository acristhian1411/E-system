ActiveAdmin.register Compra do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :provider_id, :admin_user_id, :num_factura, :fecha_compra, :compra_detalles_attributes[:id, :producto_id, :descuento, :cantidad, :precio_compra]

#controller do
   #define_method :permitted_params do
  #   params.permit Compra.permitted_params, :compra_detalle_id,
  #                  compra_detalles: [:cantidad, :descuento, :precio_compra, :compra_id, :producto_id ]
   #end
# end
# controller do
#   def imprimir
#     puts params_compra
#   end
# end

index do
  column :provider_id
  column :fecha_compra
  column :num_factura

  column do |invoice|
    link_to("Details", admin_compra_path(invoice)) + " | " + \
    link_to("Edit", edit_admin_compra_path(invoice)) + " | " + \
    link_to("Delete", admin_compra_path(invoice), :method => :delete, :confirm => "Are you sure?")
  end
end


form do |f|
    f.input :provider_id,  label: "Proveedor", :as => :select, :collection => Provider.all.map{|a|["#{a.razon_social}", a.id]}
    f.input :admin_user_id, label: "Usuario", :as => :select, :collection => AdminUser.all.map{|a|["#{a.email}", a.id]}
    f.input :num_factura, label: "Numero de factura"
    f.input :fecha_compra, label: "Fecha de compra"
  f.inputs "Detalles" do
    f.has_many :compra_detalles do |i|
      i.input :_destroy, :as => :boolean, :label => "Eliminar este articulo" unless i.object.id.nil?
      i.input :producto_id,  label: "Producto", :as => :select, :collection => Producto.all.map{|a|["#{a.prod_descrip}", a.id]}
      i.input :cantidad
      i.input :precio_compra, label: "Precio de compra"
      i.input :descuento, :hint => "Ingrese el descuento"
    end
  end
  f.actions
end

end
