class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_log_in
  # GET /users
  # GET /users.json
  def index
    if is_admin
      @users = User.all
    else
      redirect_to user_path(session[:user_id]) and return
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @user.id != session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end

  # GET /users/new
  def new
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    end
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if !is_admin
      if @user.id != session[:user_id]
        redirect_to user_path(session[:user_id]) and return
      else
        render :edit
      end
    end
  end

  # POST /users
  # POST /users.json
  def create
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    else
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if !is_admin
      if @user.id != session[:user_id]
        redirect_to user_path(session[:user_id]) and return
      end
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def is_admin
      if session[:authority] === 1 || session[:authority] === 6
        return true
      else
        return false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {}).permit(:first_name, :last_name, :email, :position, :username, :password)
    end
end
