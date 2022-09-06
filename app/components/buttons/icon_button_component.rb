# frozen_string_literal: true

class Buttons::IconButtonComponent < ViewComponent::Base
  def initialize(title:, icon:, action_url:)
    @title = title
    @icon = icon
    @action_url = action_url
  end
end
