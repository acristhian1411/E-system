ActiveAdmin.register Producto do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

menu parent: "Producto", label: "Productos"

 permit_params :iva, :precio_venta, :prod_active, :prod_descrip, :category_id, :marca_id, :provider_id, :sub_category_id

 scope :inactivo
 scope :activo
 scope :todos

 # Filtros de busqueda
 filter :prod_descrip, label: "Descripcion"

end
