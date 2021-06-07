require 'spree/core'
require 'solidus_simple_dash/config'

module SolidusSimpleDash
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree
    engine_name 'solidus_simple_dash'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_simple_dash.add_admin_section' do
      Spree::Backend::Config.configure do |config|
        # This is the email submenu, useful for store users
        config.menu_items << config.class::MenuItem.new(
          [:overview],
          'bar-chart',
          label: 'overview',
          condition: -> { can?(:manage, ::Spree::Overview) }
        )
      end
    end
  end
end
