# frozen_string_literal: true

class Buttons::ActionButtonComponent < ViewComponent::Base
  def initialize(title:, action_url: nil, disabled: false, params: nil, method: :get, classes: nil)
    @title = title
    @action_url = action_url
    @disabled = disabled
    @params = params
    @method = method
    @classes = classes
  end
end
