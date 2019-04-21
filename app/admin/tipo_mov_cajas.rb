ActiveAdmin.register TipoMovCaja do
  menu parent: "Cajas", label: "Tipo de movimientos"
  permit_params :descripcion

  action_item :activado, only: :show do
    link_to "Activar", activado_admin_tipo_mov_caja_path(tipo_mov_caja), method: :put if !tipo_mov_caja.activo
  end
  # Funcion para activar registro
  member_action :activado, method: :put do
  caja = TipoMovCaja.find(params[:id])
  caja.update(activo: true)
  redirect_to admin_tipo_mov_caja_path
  end

  # Controlador personalizado para softDelete
  controller do

    def destroy
      caja = TipoMovCaja.find(params[:id])
      caja.update_attribute(:activo, false)
      redirect_to admin_tipo_mov_caja_path
    end

  end

  # Boton atras en vista show
  action_item :view, only: :show do
    link_to 'Atras', admin_tipo_mov_caja_path
  end

  scope :inactivo
  scope :activo, :default => true
  scope :todos

  filter :descripcion

  index title: "Tipos de movimientos de caja" do
    column :descripcion
    actions
  end

  form do |f|
    f.input :descripcion
    f.actions
  end

end
