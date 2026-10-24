require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module AuthRbacDemo
  class Application < Rails::Application
    config.load_defaults 8.1
    config.eager_load = false
    config.secret_key_base = ENV.fetch("SECRET_KEY_BASE") do
      raise "Set SECRET_KEY_BASE outside development/test" unless Rails.env.local?

      "local-demo-only-secret-key-base-not-for-production-6b95de03"
    end
    config.cache_store = :memory_store
    config.session_store :cache_store,
                         key: "_auth_rbac_demo_session",
                         expire_after: 1.hour,
                         httponly: true,
                         same_site: :lax,
                         secure: Rails.env.production?
    config.action_controller.raise_on_missing_callback_actions = true
  end
end
