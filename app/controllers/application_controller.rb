class ApplicationController < ActionController::Base
	 include ActiveAdmin::Audit::ControllerHelper
before_action :set_paper_trail_whodunnit

end
