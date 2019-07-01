ActiveAdmin.register MovCaja do

  menu parent: "Cajas", label: "Movimientos de caja"

#actions  :create

 permit_params :fecha_transaccion, :num_comprobante
 #, :attributes, :on, :model
 scope :cerrado
 scope :abierto, :default => true




end
