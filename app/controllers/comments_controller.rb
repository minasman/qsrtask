class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :require_log_in

  # GET /comments
  # GET /comments.json
  def index
    if is_admin || is_ops
      @comments = Comment.all
    else
      redirect_to user_path(session[:user_id]) and return
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    end
    @comment = Comment.new
    @comment.guest = Guest.new
  end

  # GET /comments/1/edit
  def edit
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    end
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:user_id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_path(session[:user_id]), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    end
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to user_path(session[:user_id]), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if !is_admin
      redirect_to user_path(session[:user_id]) and return
    end
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to user_path(session[:user_id]), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def open
    if is_admin || is_ops
      @comments = Comment.where("status"=>"Open").order("store_id").order("source").order("visit_date")
      respond_to do |format|
        format.html
        format.json { render json: @comments}
      end
    else
      redirect_to user_path(session[:user_id]) and return
    end
  end

  def find
    @comment = Comment.find_by("case_number": params[:case_number])
    respond_to do |format|
      format.html { redirect_to comment_path(@comment.id)}
      format.json {render json: @comment}
    end
  end

  def guest_comments
    if is_admin || is_ops
      if params[:store]
        @comments = Comment.where("store_id"=>params[:store]).where("guest_id"=> params[:id]).order("visit_date")
      else
        @comments = Comment.where("guest_id"=> params[:id]).order("store_id").order("visit_date")
      end
      respond_to do |format|
        format.html
        format.json {render json: @comments}
      end
    else
      redirect_to user_path(session[:user_id]) and return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:visit_date, :visit_time, :comment_type, :source, :urgent, :case_number, :first_issue, :first_issue_comment, :second_issue, :second_issue_comment, :third_issue, :third_issue_comment, :contact_type, :visit_type, :employee_named, :status, :guest_id, :store_id,
        guest_attributes: [:first_name, :last_name, :phone, :email])
    end
end
