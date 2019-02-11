class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :require_log_in
  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    end
  end

  # GET /stores/1/edit
  def edit
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    end
  end

  # POST /stores
  # POST /stores.json
  def create
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    else
      @store = Store.new(store_params)
      respond_to do |format|
        if @store.save
          format.html { redirect_to @store, notice: 'Store was successfully created.' }
          format.json { render :show, status: :created, location: @store }
        else
          format.html { render :new }
          format.json { render json: @store.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    else
      respond_to do |format|
        if @store.update(store_params)
          format.html { redirect_to @store, notice: 'Store was successfully updated.' }
          format.json { render :show, status: :ok, location: @store }
        else
          format.html { render :edit }
          format.json { render json: @store.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    else
      @store.destroy
      respond_to do |format|
        format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :store_number, :store_email, :street_address, :city, :state, :zip_code,
        :phone, :owner_id, :director_id, :om_id, :supervisor_id, :gm_id)
    end
end
