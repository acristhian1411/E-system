ActiveAdmin.register Cliente do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cliente", label: " Clientes"
 permit_params :nombre, :apellido, :n_cedula, :direccion, :cli_telefono, :limite_credito, :activo, :ciudade_id, :barrio_id

controller do
  def destroy
    cliente = Cliente.find(params[:id])
    cliente.update_attribute(:activo, false)
    redirect_to admin_clientes_path
  end
end

action_item :view, only: :show do
  link_to 'Atras', admin_clientes_path
end

# Link para activar registro
action_item :activado, only: :show do
  link_to "Activar", activado_admin_cliente_path(cliente), method: :put if !cliente.activo
end
# Funcion para activar registro
member_action :activado, method: :put do
sub_category = Cliente.find(params[:id])
sub_category.update(activo: true)
redirect_to admin_clientes_path
end

 # lista segun activo o no
 scope :inactivo
 scope :activo, :default => true
 scope :todos

 filter :nombre, label: "Nombre"

# tabla en index
 index title: "Clientes" do
  column "Nombre", :nombre, :apellido
 	column "Numero de cedula", :n_cedula
 	#column "Direccion", :direccion
  column :direccion do |cliente|
    truncate cliente.direccion
  end
  actions dropdown: true do |client|
#    item("Mostrar", admin_cliente_path(client))
#    item("Editar", edit_admin_cliente_path(client))
#    item("Eliminar", admin_cliente_path(client), :method => :delete, :confirm => "Are you sure?")
  end

 end

# Formulario personalizado
form title: 'Clientes' do |f|
    inputs 'Detalles' do
      input :nombre, label: "Nombre"
      input :apellido, label: "Apellido"
      input :n_cedula, label: "Num de Cedula"
      input :direccion, label: "Direccion"
      input :cli_telefono, label: "Num de telefono"
      input :limite_credito, label: "Limite de credito"
      input :ciudade_id,  label: "Ciudad", :as => :select, :collection => Ciudade.all.map{|a|["#{a.descripcion}", a.id]}
      input :barrio_id,  label: "Barrio", :as => :select, :collection => Barrio.all.map{|a|["#{a.descripcion}", a.id]}
    end
      actions
    end

  show :title => :nombre do
    panel "Client Details" do
      attributes_table_for cliente do
        row("Nombre") { cliente.nombre }
        row("Apellido") { cliente.apellido }
        row("Cedula") { cliente.n_cedula }
        row("Telefono") { cliente.cli_telefono }
        row("Direccion") { cliente.direccion }
        row("Activo") { cliente.activo }
        row(:ciudad) { |payment| payment.ciudade.descripcion }
        row(:barrio) { |payment| payment.barrio.descripcion }
      end
    end
  end

end
