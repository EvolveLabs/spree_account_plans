module Spree
  Variant.class_eval do
    before_save :set_default_isssues_number
    delegate :subscribable?, :to => :product

    def set_default_isssues_number
      self.interval_length = Spree::Subscriptions::Config.default_issues_number if !self.interval_length
    end
  end
end
