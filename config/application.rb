require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups(
  pry: %i[development test]
))

module MkrsBot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # always create a spec file
    config.generators.test_framework = "rspec"

    # always create locale files defined by I18n.available_locales in
    # config/initializers/locale.rb
    config.view_component.generate.locale = true
    config.view_component.generate.distinct_locale_files = true

    # always create preview when generating components
    config.view_component.generate.preview = true

    # adjust preview path for rspec
    config.view_component.preview_paths << "#{Rails.root}/spec/components/previews"

    # use empty layout for component preview, app/views/layouts/empty.html.erb
    config.view_component.default_preview_layout = "empty"

    config.x.doc.load_path = Rails.root.join("app", "doc")
  end
end
