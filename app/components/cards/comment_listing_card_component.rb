# frozen_string_literal: true

class Cards::CommentListingCardComponent < ViewComponent::Base
  def initialize(comment:, current_user:, is_group_admin:)
    @comment = comment
    @current_user = current_user
    @is_author = comment.user_id == current_user.id
    @is_group_admin = is_group_admin
  end

end
