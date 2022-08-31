class SessionsController < ApplicationController

    def new

    end

    def login
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to home_page
        else
            # not matched
            render 'new'
        end
    end

    def current_user
        user_id = session[:user_id]
        @current_user ||= User.find(user_id) if user_id
    end

    def logged_in?
        !!session[:user_id]
    end

    def destroy
        session[:user_id] = nil
        redirect_to login
    end

end