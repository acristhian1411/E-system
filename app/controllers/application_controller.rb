require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

	 include ActiveAdmin::Audit::ControllerHelper
before_action :set_paper_trail_whodunnit

end
