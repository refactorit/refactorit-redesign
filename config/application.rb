require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RefactoritRedesign
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Add folders to the auto load path
    config.autoload_paths += %W(#{config.root}/app/forms)
    config.autoload_paths += %W(#{config.root}/app/services)
  end
end
