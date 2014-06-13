class BenmarksController < ApplicationController
  before_action :set_benmark, only: [:show, :edit, :update, :destroy]

  # GET /benmarks
  # GET /benmarks.json
  def index
    @benmarks = current_user.benmarks
  end

  # GET /benmarks/1
  # GET /benmarks/1.json
  def show
  end

  # GET /benmarks/new
  def new
    @benmark = current_user.benmarks.new
  end

  # GET /benmarks/1/edit
  def edit
  end

  # POST /benmarks
  # POST /benmarks.json
  def create
    @benmark = current_user.benmarks.new(benmark_params)

    respond_to do |format|
      if @benmark.save
        format.html { redirect_to @benmark, notice: 'Benmark was successfully created.' }
        format.json { render action: 'show', status: :created, location: @benmark }
      else
        format.html { render action: 'new' }
        format.json { render json: @benmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benmarks/1
  # PATCH/PUT /benmarks/1.json
  def update
    respond_to do |format|
      if @benmark.update(benmark_params)
        format.html { redirect_to @benmark, notice: 'Benmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @benmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benmarks/1
  # DELETE /benmarks/1.json
  def destroy
    @benmark.destroy
    respond_to do |format|
      format.html { redirect_to benmarks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benmark
      @benmark = Benmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def benmark_params
      params.require(:benmark).permit(:url, :user_id, :topics[])
    end
end
