# frozen_string_literal: true

class Links::ButtonLinkComponent < ViewComponent::Base
  def initialize(text:, link:)
    @text = text
    @link = link
  end
end
