# frozen_string_literal: true

class Cards::PostListingCardComponent < ViewComponent::Base
  def initialize(post:, current_user:)
    @post = post
    @current_user = current_user
    @is_author = post.author_id == @current_user.id
  end

end
