class CommentUpdatesController < ApplicationController
  before_action :set_comment, only: [:new, :index, :create]
  before_action :require_log_in

  # GET /comment_updates
  # GET /comment_updates.json
  def index
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
  end

  # GET /comment_updates/1
  # GET /comment_updates/1.json
  def show
  end

  # GET /comment_updates/new
  def new
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
    @comment.comment_updates.build
  end

  # GET /comment_updates/1/edit
  def edit
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
  end

  # POST /comment_updates
  # POST /comment_updates.json
  def create
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
    @comment_update = @comment.comment_updates.create(comment_params)
    @comment_update.user_id = session[:user_id]
    if params[:comment_update][:status] && params[:comment_update][:status] == "Closed"
      @comment.status = "Closed"
      @comment.save
  end
    respond_to do |format|
      if @comment_update.save
        format.html { redirect_to comment_path(@comment), notice: 'Comment update was successfully created.' }
        format.json { render :show, status: :created, location: @comment_update }
      else
        format.html { render :new }
        format.json { render json: @comment_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_updates/1
  # PATCH/PUT /comment_updates/1.json
  def update
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
    respond_to do |format|
      if @comment_update.update(comment_update_params)
        format.html { redirect_to @comment_update, notice: 'Comment update was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_update }
      else
        format.html { render :edit }
        format.json { render json: @comment_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_updates/1
  # DELETE /comment_updates/1.json
  def destroy
    if session[:authority] != 1 || session[:authority] != 2 || session[:authority] != 6
      redirect_to user_path(session[:user_id])
    end
    @comment_update.destroy
    respond_to do |format|
      format.html { redirect_to comment_updates_url, notice: 'Comment update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment_update).permit(:update_date, :update_time, :user_id, :update_type, :employee_name, :current_update, :comment_id)
    end
end
