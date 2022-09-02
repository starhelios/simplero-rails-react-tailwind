class Buttons::OutlineButtonComponent < ViewComponent::Base
  def initialize(title:, action: nil, type: 'button')
    @title = title
    @action = action
    @type = type
  end
end
  