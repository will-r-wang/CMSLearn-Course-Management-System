require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module COMP3004Cms
  class Application < Rails::Application
    config.load_defaults 6.1

    config.autoload_paths += [
      "#{Rails.root}/lib",
      "#{Rails.root}/app/services/factories",
    ]
  end
end
