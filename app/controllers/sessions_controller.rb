class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:alert] = "Logged in"
            redirect_to home_path
        else
            flash.now[:alert] = "Worng email and password"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:alert] = "Logged out"
        redirect_to home_path
    end
end