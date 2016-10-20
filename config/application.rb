require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module ShakuroFeedback
  class Application < Rails::Application
    paths = [
      Rails.root.join('lib').to_s
    ]

    config.autoload_paths += paths
    config.eager_load_paths += paths
  end
end
