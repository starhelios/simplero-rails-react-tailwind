# frozen_string_literal: true

class Cards::GroupListingCardComponent < ViewComponent::Base
  def initialize(group:, current_user:)
    @group = group
    @current_user = current_user
    @group_member_ids = group.group_members.pluck(:user_id)
    @is_owner = group.owner_id == current_user.id
    @is_member = @group_member_ids.include? @current_user.id
    @requestor_ids = group.joining_requests.pluck(:user_id)
    @is_requested = @requestor_ids.include? @current_user.id
    @btn_text = if @is_member
      "Joined"
    else
      (@is_requested ? "Requsted" : "Join")
    end
  end
end
