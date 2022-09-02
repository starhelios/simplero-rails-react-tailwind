# frozen_string_literal: true

class Input::CommentInputComponent < ViewComponent::Base
  def initialize(comment: nil, post_id: nil, user_id: nil, reply_to: nil)
    @comment = comment
    @post_id = post_id
    @user_id = user_id
    @reply_to = reply_to
  end

end
