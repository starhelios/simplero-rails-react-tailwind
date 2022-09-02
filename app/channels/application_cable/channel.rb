module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def subscribed
      authenticate_user!
    end

    private

    def authenticate_user!
    end
  end
end
