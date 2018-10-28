ActiveAdmin.register AdminUser do
  menu parent: "Usuarios", label: "Usuarios"

  role_changeable

  permit_params :email, :password, :password_confirmation, :role

  index title: "Usuarios" do
    selectable_column
    id_column
    column :email
    column "Roles", :role
    column "Creado", :created_at
    actions dropdown: true do |client|
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at, label: "Creado"
  filter :role, label: "Roles", :as => :select

  form do |f|
    f.inputs do
      f.input :email
      f.input :password, label: "Contraseña"
      f.input :password_confirmation, label: "Confirme su Contraseña"
      f.input :role, label: "Roles", :as => :select
    end
    f.actions
  end

  # Vista show
   show :title => :email  do
     attributes_table do
       row :email
       row :role
       row :created_at
     end
   end


end
