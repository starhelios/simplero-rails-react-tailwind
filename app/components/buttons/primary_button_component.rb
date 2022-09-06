class Buttons::PrimaryButtonComponent < ViewComponent::Base
  def initialize(title:, action: nil, classes: nil, type: "button")
    @title = title
    @action = action
    @classes = classes
    @type = type
  end
end
