ActiveAdmin.register Barrio do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cliente", label: " Barrio"
 permit_params :descripcion,  :activo  

 scope :inactivo
 scope :activo
 scope :todos

end
