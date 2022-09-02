# frozen_string_literal: true

class Tabs::SimpleTabsComponent < ViewComponent::Base
  def initialize(tabs:, active_key:, on_change:, keys: [])
    @tabs = tabs
    @active_key = active_key
    @on_change = on_change
    @keys = keys
  end
end
