# frozen_string_literal: true

class Buttons::ActionButtonComponent < ViewComponent::Base
  def initialize(title:, action_url: nil, disabled: false, params: nil, method: :get)
    @title = title
    @action_url = action_url
    @disabled = disabled
    @params = params
    @method = method
  end

end
