ActiveAdmin.register CreditoCliente do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :cliente_id, :venta_id, cuota_clientes_attributes:[:id, :monto_cuota, :monto_pagado, :estado, :cantidad_cuota, :intereses, :credito_cliente_id]

action_item :view, only: :show do
  link_to 'Atras', admin_venta_path
end

index do
   column :cliente do |venta|
      venta.cliente.nombre
   end
actions
end



end
