require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:en, :vi]
    config.i18n.default_locale = :vi
  end
end

module LazyLookupI18n
  extend ActiveSupport::Concern

  class_methods do
    def t i18n_key, options = {}
      if superclass != Object
        super_prefix_key = superclass.name.underscore.tr "/", "."
        default = I18n.t("#{super_prefix_key}#{i18n_key}", options)
      end

      prefix_key = name.underscore.tr "/", "."
      I18n.t("#{prefix_key}#{i18n_key}", options.merge(default: default))
    end
  end

  def t i18n_key, options = {}
    self.class.t i18n_key, options
  end
end
