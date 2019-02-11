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
            session[:user_name] = @user.full_name
            if @user.position === "Owner" || @user.position === "Director"
                session[:authority] = 1
            elsif @user.position === "Operations Manager" || @user.position === "Supervisor"
                session[:authority] = 2
            elsif @user.position === "General Manager" || @user.position === "Manager"
                session[:authority] = 3
            elsif @user.position === "Maint Department Head"
                session[:authority] = 4
            elsif @user.position === "Field Tech"
                session[:authority] = 5
            elsif @user.position === "Office"
                session[:authority] = 6
            else session[:authority] = 0
            end
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
