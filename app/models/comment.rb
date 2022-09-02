class Comment < ApplicationRecord

  validates :description, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :reply_to, presence: false

  belongs_to :user
  belongs_to :post

  belongs_to :reply_to_comment,  class_name: "Comment", foreign_key: :reply_to, optional: true
  has_many   :replies, class_name: "Comment", foreign_key: :reply_to, dependent: :destroy
  after_save :broadcast_alert

  private
    def broadcast_alert
      post = Post.find(self.post_id)
      user = User.find(post.author_id)
      current_user = User.find(self.user_id)
      comment_body = "#{current_user.email} commented on <a href=\"/posts/#{post.id}\" class=\"font-semibold underline hover:text-blue-800 dark:hover:text-blue-900\"> #{post.title}</a>"
      NotificationChannel.broadcast_to(user, 
        {
          body: comment_body, 
          post_id: post.id
        }
      )
      NotificationMailer.with(user: user, body: "#{current_user.email} commented on #{post.title}").notification.deliver_now!

      if self.reply_to_comment != nil
        replied_user = User.find(self.reply_to_comment.user_id)
        replied_body =  "#{current_user.email} replied to your comment on <a href=\"/posts/#{post.id}\" class=\"font-semibold underline hover:text-blue-800 dark:hover:text-blue-900\"> #{post.title}</a>"
        NotificationChannel.broadcast_to(replied_user, 
          {
            body: replied_body, 
            post_id: post.id
          }
        )
        
        NotificationMailer.with(user: replied_user, body: "#{current_user.email} replied to your comment on #{post.title}").notification.deliver_now!
      end

      check_mention.each do |user|
        email = user[1..-1]
        user = User.where(email: email).first()
        if user
          mentioned_body = "#{current_user.email} mentioned you on <a href=\"/posts/#{post.id}\" class=\"font-semibold underline hover:text-blue-800 dark:hover:text-blue-900\"> #{post.title}</a>"
          NotificationChannel.broadcast_to(user, 
            {
              body: mentioned_body, 
              post_id: post.id
            }
          )
          NotificationMailer.with(user: user, body: "#{current_user.email} mentioned you on #{post.title}").notification.deliver_now!
        end  
      end
    end

    def check_mention
      self.description.split(" ").select{|item| item.start_with?("@")}
    end
end
