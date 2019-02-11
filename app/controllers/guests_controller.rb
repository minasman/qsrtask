class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  before_action :require_log_in

  # GET /guests
  # GET /guests.json
  def index
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6 || session[:authority] != 3
      redirect_to user_path(session[:user_id])
    end
    @guests = Guest.all
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6 || session[:authority] != 3
      redirect_to user_path(session[:user_id])
    end
  end

  # GET /guests/new
  def new
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
  end

  # POST /guests
  # POST /guests.json
  def create
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Guest was successfully created.' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.fetch(:guest, {})
    end
end
