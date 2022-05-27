class TweeetsController < ApplicationController
  before_action :set_tweeet, only: %i[ show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tweeets = Tweeet.order('created_at DESC').first(6)
  end

  def show
  end

  def new
    @tweeet = current_user.tweeets.build
  end

  def edit
  end
  
  def create
    @tweeet = current_user.tweeets.build(tweeet_params)

    respond_to do |format|
      if @tweeet.save
        format.html { redirect_to root_path, notice: "Tweeet was successfully created." }
        format.json { render :show, status: :created, location: @tweeet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @tweeet.update(tweeet_params)
        format.html { redirect_to tweeet_url(@tweeet), notice: "Tweeet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweeet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @tweeet.destroy

    respond_to do |format|
      format.html { redirect_to tweeets_url, notice: "Tweeet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweeet
      @tweeet = Tweeet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweeet_params
      params.require(:tweeet).permit(:tweeet, :title, :user_id)
    end
end
