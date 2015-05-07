class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :set_view_movie, only: [:view]

  # GET /movies
  # GET /movies.json
  def index
    if params[:tag]
      @movies = Movie.tagged_with(params[:tag])
    else
    @movies = Movie.all
  end
  end

  def list
    if params[:tag]
      @movies = Movie.tagged_with(params[:tag])
    else
    @movies = Movie.all
  end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  def view
    @hash = Gmaps4rails.build_markers(@movie) do |user, marker|
      marker.lat user.hour
      marker.lng user.minute
      marker.infowindow user.address
      marker.json({title: user.videoId})
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  def add_tags
    movies = Movie.all
    girl_walkers = ["YUKINO","YUKAKO","AKANE","NATSUKI","TUCHIYA","KURUMI","CHIAKI","MIZUKI","YURIA"]
    movies.each do |movie|
      girl_walkers.each do |walker|
          if movie.walker == walker
          movie.tag_list += "girl"
          end

           movie.tag_list +=  "," + "morning" if movie.hour <11 && movie.hour>4
           movie.tag_list +=  "," + "midnight" if movie.hour <4 && movie.hour>= 0
           movie.tag_list +=  "," + "night" if movie.hour < 24 && movie.hour> 18
           movie.tag_list += "," + movie.city
      end
      movie.save
    end

  end

  # GET /movies/1/edit
  def edit

  end
  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    @movie.address = @movie.city + " " + @movie.country
    @movie.thumnail_url = "https://mood2travel.s3.amazonaws.com/thumnails/" + @movie.videoId.to_s + ".png"

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def set_view_movie
      @movie = Movie.find_by_videoId(params[:videoId])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:videoId, :youtubeID, :city, :country, :hour, :minute, :director, :directorUrl, :walker, :walkerUrl,:address,:thumnail_url,:tag_list)
    end
end
