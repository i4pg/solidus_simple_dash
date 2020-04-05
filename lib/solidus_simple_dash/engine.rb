require 'spree/core'

module SolidusSimpleDash
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions::Decorators

    isolate_namespace ::Spree
    engine_name 'solidus_simple_dash'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    config.autoload_paths += %W(#{config.root}/lib)

    initializer 'solidus_simple_dash.environment', before: :load_config_initializers do
      SolidusSimpleDash::Config = SolidusSimpleDash::Configuration.new
    end
  end
end
