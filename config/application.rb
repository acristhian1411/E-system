require_relative 'boot'

require 'rails/all'
# Require para la descarga de archivos PDF
require 'pdfkit'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ESystem
  class Application < Rails::Application
	# para la descarga de archivos PDF
  	config.middleware.use PDFKit::Middleware

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
