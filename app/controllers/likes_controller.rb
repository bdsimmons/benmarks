class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = current_user.likes.build(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_to benmarks_url, notice: 'Like was successfully created.' }
        format.js
      else
        format.html { render action: 'new' }
        format.js
      end
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like = current_user.likes.where(benmark_id: params[:benmark_id]).first
    Rails.logger.info ">>>>> #{@like.inspect}"
    @like.destroy
    respond_to do |format|
      format.html { redirect_to benmarks_url }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.permit(:user_id, :benmark_id)
    end
end
