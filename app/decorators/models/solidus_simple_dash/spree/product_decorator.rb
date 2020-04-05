module SolidusSimpleDash
  module Spree
    module ProductDecorator
      def self.prepended(base)
        base.scope :out_of_stock, -> do
          joins(:stock_items).
          where('spree_stock_items.count_on_hand = 0')
        end
      end

      ::Spree::Product.prepend self
    end
  end
end
