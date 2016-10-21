require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module ShakuroFeedback
  class Application < Rails::Application
    paths = [
      Rails.root.join('lib'),
      Rails.root.join('app/services')
    ]

    config.autoload_paths += paths
    config.eager_load_paths += paths
  end
end
