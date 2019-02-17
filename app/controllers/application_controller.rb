class ApplicationController < ActionController::Base
	 include ActiveAdmin::Audit::ControllerHelper
<<<<<<< HEAD

	 before_action :set_paper_trail_whodunnit


 protected

 def user_for_paper_trail
	 admin_user_signed_in? ? current_admin_user.try(:id) : 'Unknown user'
 end
=======
before_action :set_paper_trail_whodunnit

>>>>>>> 2fb7d327517539720b7b234cdeabcf76b1d484dd
end
