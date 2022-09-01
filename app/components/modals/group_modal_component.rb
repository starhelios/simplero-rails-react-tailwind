# frozen_string_literal: true

class Modals::GroupModalComponent < ViewComponent::Base
  def initialize(edit:, group:, hanlde_submit:, on_hide:)
    @edit = edit
    @group = group
    @hanlde_submit = hanlde_submit
    @on_hide = on_hide
  end

end
