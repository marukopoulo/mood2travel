class FavsController < ApplicationController
  before_action :set_fav, only: [:show, :edit, :update, :destroy]

  # GET /favs
  # GET /favs.json
  def index
    @favs = Fav.all
  end

  # GET /favs/1
  # GET /favs/1.json
  def show
  end

  # GET /favs/new
  def new
    @fav = Fav.new
  end

  # GET /favs/1/edit
  def edit
  end

  # POST /favs
  # POST /favs.json

  def create
    @fav = Fav.find_or_create_by(movie_id: params[:movie_id], user_id: current_user.id, value: rand(10000))
    render layout: nil
  end

#  def create
#    @fav = Fav.new(fav_params)
#
 #   respond_to do |format|
  #    if @fav.save
   #     format.html { redirect_to @fav, notice: 'Fav was successfully created.' }
     #   format.json { render action: 'show', status: :created, location: @fav }
     # else
      #  format.html { render action: 'new' }
       # format.json { render json: @fav.errors, status: :unprocessable_entity }
     # end
   # end
  #end

  # PATCH/PUT /favs/1
  # PATCH/PUT /favs/1.json
  def update
    respond_to do |format|
      if @fav.update(fav_params)
        format.html { redirect_to @fav, notice: 'Fav was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favs/1
  # DELETE /favs/1.json
  def destroy
    @fav.destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fav
      @fav = Fav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fav_params
      params.require(:fav).permit(:user_id, :movie_id, :value)
    end
end
