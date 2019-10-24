class DisscussionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_owned_disscussion, only: [:edit, :update, :destroy]

  # GET /disscussions
  # GET /disscussions.json
  def index
    @disscussions = Disscussion.all
  end

  # GET /disscussions/1
  # GET /disscussions/1.json
  def show
    @disscussion = Disscussion.find(params[:id])
  end

  # GET /disscussions/new
  def new
    @disscussion = Disscussion.new
  end

  # GET /disscussions/1/edit
  def edit
  end

  # POST /disscussions
  # POST /disscussions.json
  def create
    @disscussion = current_user.disscussions.new(disscussion_params)

    respond_to do |format|
      if @disscussion.save
        format.html { redirect_to @disscussion, notice: 'Disscussion was successfully created.' }
        format.json { render :show, status: :created, location: @disscussion }
      else
        format.html { render :new }
        format.json { render json: @disscussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disscussions/1
  # PATCH/PUT /disscussions/1.json
  def update
    respond_to do |format|
      if @disscussion.update(disscussion_params)
        format.html { redirect_to @disscussion, notice: 'Disscussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @disscussion }
      else
        format.html { render :edit }
        format.json { render json: @disscussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disscussions/1
  # DELETE /disscussions/1.json
  def destroy
    @disscussion.destroy
    respond_to do |format|
      format.html { redirect_to disscussions_url, notice: 'Disscussion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owned_disscussion
      begin
        @disscussion = current_user.disscussions.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:notice ] = "You don't have access to that"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disscussion_params
      params.require(:disscussion).permit(:headline, :content)
    end
end
