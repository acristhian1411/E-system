ActiveAdmin.register Ciudade do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cliente", label: "Ciudades"

 scope :inactivo
 scope :activo
 scope :todos

permit_params :descripcion,  :activo  


end
