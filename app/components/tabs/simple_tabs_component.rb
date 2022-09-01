# frozen_string_literal: true

class Tabs::SimpleTabsComponent < ViewComponent::Base
  def initialize(tabs:, active_tab:, on_change:)
    @tabs = tabs
    @active_tab = active_tab
    @on_change = on_change
  end

end
