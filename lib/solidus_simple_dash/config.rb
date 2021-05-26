module SolidusSimpleDash
  class Configuration < Spree::Preferences::Configuration
    preference :limit, :integer, default: 10
  end

  Config = Configuration.new
end
