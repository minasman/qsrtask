class SessionsController < ApplicationController
    before_action :require_log_in, except: [:new, :create, :index]

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id
            session[:position] = @user.position
            session[:user_name] = @user.first_name + " " + @user.last_name
            redirect_to @user
        else
            flash.alert = "Username and/or Password Not Found"
            redirect_to signin_path, notice: 'User Not Found'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

end
