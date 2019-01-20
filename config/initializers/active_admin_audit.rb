ActiveAdmin::Audit.setup do |config|
  # == User class name
  #
  # Set the name of the class that is used as the AdminUser.
  # Defaults to AdminUser
  #
  
  config.user_class_name = :admin_user
end
