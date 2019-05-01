ActiveAdmin.register Stock do

menu parent: "Stock", label: "Stock"

actions :index

scope :artigas
scope :ruta1
scope :matriz, :default => true
scope :todos

filter :producto_id, collection: -> { Producto.activo },
label: 'Producto', :as => :select, :collection => Producto.activo.map{|a|["#{a.prod_descrip}", a.id]}

filter :sucursal_id, collection: -> { Sucursal.activo },
label: 'Sucursal', :as => :select, :collection => Sucursal.activo.map{|a|["#{a.suc_descrip}", a.id]}




index title: "Productos" do
  column("Producto") { |payment| payment.producto.prod_descrip }
  column :cantidad
end

end
