ActiveAdmin.register Barrio do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Ventas", label: "Barrios"
# Campos permitidos para formulario
 permit_params :descripcion,  :activo

 controller do
   def destroy
     barrio = Barrio.find(params[:id])
     barrio.update_attribute(:activo, false)
     redirect_to admin_barrios_path
   end
#descargar PDF

 
# crear pdf inicio
require 'prawn/table'
require 'prawn'

# Using explicit block form and rendering to a file
content = "hjjj"
Prawn::Document.generate "ejemplo.pdf" do |pdf|
  # self here is left alone
  pdf.font "Times-Roman"
  pdf.draw_text content, :at => [200,720], :size => 32
 

end

# crear pdf fin
 end
 


 action_item :view, only: :show do
   link_to 'Atras', admin_barrios_path
 end

 # Link para activar registro
 action_item :activado, only: :show do
   link_to "Activar", activado_admin_barrio_path(barrio), method: :put if !barrio.activo
 end

   
 


 

  # Funcion para activar registro
  member_action :pdf, method: :put do
    barrio = Barrio.find(params[:id])
    respond_to do |format|
     format.html
     format.json
     format.pdf{render template: 'barrio/pdf', pdf: 'reporte', layouts: 'pdf.html'}
     end
  end

 # Link para descargar pdf
 action_item :pdf, only: :show do
 link_to "Descargar PDF", pdf_admin_barrio_path(format: 'pdf_file')
 end

 # Funcion para activar registro
 member_action :activado, method: :put do
 sub_category = Barrio.find(params[:id])
 sub_category.update(activo: true)
 redirect_to admin_barrios_path
 end
 # Link para activar registro
 action_item :activar, only: :show do
   link_to "Activar", activado_admin_barrio_path(barrio), method: :put if !barrio.activo
 end


# lista segun activo o no
 scope :inactivo
 scope :activo, :default => true
 scope :todos

# filtros de busqueda
 filter :descripcion

# tabla de index
 index title: "Barrios" do
 	 column "Descripcion", :descripcion
	 column "Creado", :created_at
   actions  do |barrio|
     #link_to("Mostrar", admin_barrio_path(client)) + " | " + \
     #link_to("Editar", edit_admin_barrio_path(client)) + " | " + \
     #link_to("Eliminar", admin_barrio_path(client), :method => :delete, :confirm => "Are you sure?")

     


   end
 end

 # Formulario personalizado
 form title: 'Barrios' do |f|
     inputs 'Detalles' do
       input :descripcion, label: "Descripcion"
     end
     actions
   	end

# Vista show
 show title: "Barrio"  do
   attributes_table do
     row :descripcion
     row :activo
     row :created_at
   end
 end


end
