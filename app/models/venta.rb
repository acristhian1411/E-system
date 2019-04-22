# == Schema Information
#
# Table name: venta
#
#  id            :bigint(8)        not null, primary key
#  activo        :boolean
#  fecha         :date
#  forma_pago    :string
#  num_factura   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :bigint(8)
#  cliente_id    :bigint(8)
#  sucursal_id   :bigint(8)
#
# Indexes
#
#  index_venta_on_admin_user_id  (admin_user_id)
#  index_venta_on_cliente_id     (cliente_id)
#  index_venta_on_sucursal_id    (sucursal_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_user_id => admin_users.id)
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (sucursal_id => sucursals.id)
#

class Venta < ApplicationRecord
  has_paper_trail

  belongs_to :admin_user
  belongs_to :sucursal
  belongs_to :cliente
  has_many :venta_detalle
  has_many :credito_cliente

  accepts_nested_attributes_for :venta_detalle

  validates :admin_user_id, :presence => true
  validates :cliente_id, :presence => true
  validates :sucursal_id, :presence => true
  validates :num_factura, :presence => true
  validates :fecha, :presence => true
  validates :forma_pago, :presence => true

class << self
    def usuario(usuario)
        usuario.email
    end

    def activo
      Venta.where('activo != ?', true)
    end
end

  def venta_location
  "#{Rails.root}/app/pdfs/ventas/venta-#{self.id}.pdf"
  end

  def venta_detalles_total
    venta_detalles_total = 0
    self.venta_detalle.each do |i|
      venta_detalles_total += i.total
    end
    venta_detalles_total
  end

  def total
    venta_detalles_total
  end



  # Funcion para listar segun este activo o no
    # Todos los inactivos
    scope :inactivo, -> {
      where('activo != ?', true)
    }
    # Todos los activos
      scope :activo, -> {
      where(:activo => true)
    }
    # Todos los registros
      scope :todos, -> {
      all
    }

# buscador
#  ransacker :producto_id,
#             :formatter => -> (venta_id) {
#               detalle = VentaDetalle.where(:producto_id => Producto.ids).all
#                  ids = Venta.where(:id => VentaDetalle.venta_id)
#               (ids.empty?) ? ids << 0: ids #activeadmin translates the queries into IN operator, may get syntax error if empty
#                     # id = 0 is non-existent in Users as id >= 1
#               return ids #maybe is not needed
#               } do |parent|
#   parent.table[:id]
#   end

after_create :cuota

private
  def cuota
    if condition

    end
  end

end
