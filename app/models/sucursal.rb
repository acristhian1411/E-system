# == Schema Information
#
# Table name: sucursals
#
#  id          :bigint(8)        not null, primary key
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> b58bc0aa41873672b184cd5e16f1ccc7b8b184fd
>>>>>>> d21f0aa9ff1e7dd89b60673def0e065729f33dcd
#  direccion   :string
#  encargado   :string
#  suc_active  :boolean          default(TRUE)
#  suc_descrip :string
#  telefono    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

<<<<<<< HEAD
#  direccion   :string
#  encargado   :string
#  suc_active  :boolean          default(TRUE)
#  suc_descrip :string
#  telefono    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


=======
<<<<<<< HEAD
=======
=======
>>>>>>> 21f4d0dd24a2708ef3ada7ee4ed61d46453af06d
>>>>>>> b58bc0aa41873672b184cd5e16f1ccc7b8b184fd
>>>>>>> d21f0aa9ff1e7dd89b60673def0e065729f33dcd
#  suc_active  :boolean

#  direccion   :string
#  encargado   :string
#  suc_active  :boolean          default(TRUE)

<<<<<<< HEAD
=======
=======
<<<<<<< HEAD

=======
>>>>>>> 21f4d0dd24a2708ef3ada7ee4ed61d46453af06d
>>>>>>> b58bc0aa41873672b184cd5e16f1ccc7b8b184fd
>>>>>>> d21f0aa9ff1e7dd89b60673def0e065729f33dcd
#  suc_descrip :string
#  telefono    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sucursal < ApplicationRecord
# Validaciones
	validates :suc_descrip, presence: true

# Funcion para listar segun este activo o no
# Todos los inactivos
	scope :inactivo, -> {
  where('suc_active != ?', true)
}
	scope :activo, -> {
		# Todos los activos
  where(:suc_active => true)
}
# Todos los registros
	scope :todos, -> {
  all
}
end
