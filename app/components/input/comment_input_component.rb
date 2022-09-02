# frozen_string_literal: true

class Input::CommentInputComponent < ViewComponent::Base
  def initialize(comment: nil, post_id: nil, user_id: nil, reply_to: nil, toggle: true, editor: false)
    @comment = comment
    @post_id = post_id
    @user_id = user_id
    @reply_to = reply_to
    @toggle = toggle
    @editor = editor
  end

end
