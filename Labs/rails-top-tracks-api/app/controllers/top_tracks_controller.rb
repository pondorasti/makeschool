require 'rspotify'

class TopTracksController < ApplicationController
  before_action :set_top_track, only: [:show, :edit, :update, :destroy]

  # GET /top_tracks
  # GET /top_tracks.json
  def index
    @top_tracks = TopTrack.all
  end

  # GET /top_tracks/1
  # GET /top_tracks/1.json
  def show
  end

  # GET /top_tracks/new
  def new
    @top_track = TopTrack.new
  end

  # GET /top_tracks/1/edit
  def edit
  end

  # POST /top_tracks
  # POST /top_tracks.json
  def create
    @top_track = TopTrack.new(top_track_params)

    respond_to do |format|
      if @top_track.save
        format.html { redirect_to @top_track, notice: 'Top track was successfully created.' }
        format.json { render :show, status: :created, location: @top_track }
      else
        format.html { render :new }
        format.json { render json: @top_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /top_tracks/1
  # PATCH/PUT /top_tracks/1.json
  def update
    respond_to do |format|
      if @top_track.update(top_track_params)
        format.html { redirect_to @top_track, notice: 'Top track was successfully updated.' }
        format.json { render :show, status: :ok, location: @top_track }
      else
        format.html { render :edit }
        format.json { render json: @top_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /top_tracks/1
  # DELETE /top_tracks/1.json
  def destroy
    @top_track.destroy
    respond_to do |format|
      format.html { redirect_to top_tracks_url, notice: 'Top track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top_track
      @top_track = TopTrack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top_track_params
      params.require(:top_track).permit(:track_name, :album_name, :personal_ranking)
    end
end
