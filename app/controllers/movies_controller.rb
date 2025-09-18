class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  ALLOWED_SORTS = %w[title release_date].freeze

  # GET /movies
  def index
    @all_ratings = Movie.all_ratings
    ratings_from_params = params[:ratings]&.keys
    sort_from_params    = params[:sort_by]
    ratings = ratings_from_params || session[:ratings] || @all_ratings
    sort_by = sort_from_params    || session[:sort_by]

    if (ratings_from_params.nil? && session[:ratings].present?) ||
       (sort_from_params.nil?    && session[:sort_by].present?)
      flash.keep
      redirect_to movies_path(ratings: Hash[ratings.map { |r| [ r, "1" ] }], sort_by: sort_by, q: params[:q]) and return
    end

    session[:ratings] = ratings
    session[:sort_by] = sort_by
    @checked_ratings  = ratings
    @sort_by          = %w[title release_date].include?(sort_by) ? sort_by : nil

    scope = Movie.where(rating: @checked_ratings)
    scope = scope.where("title LIKE ?", "%#{params[:q]}%") if params[:q].present?
    @movies = @sort_by.present? ? scope.order(@sort_by) : scope
    @movies = @movies.page(params[:page]).per(10)

    @title_header_class        = (@sort_by == "title")        ? "hilite" : nil
    @release_date_header_class = (@sort_by == "release_date") ? "hilite" : nil
  end

  # GET /movies/1
  def show; end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit; end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy!
    respond_to do |format|
      format.html { redirect_to movies_path, notice: "Movie was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id]) # <- corrigido
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :release_date, :description) # <- corrigido
  end
end
