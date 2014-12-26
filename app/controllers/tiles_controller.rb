class TilesController < ApplicationController
  before_action :set_tile, only: [:show, :edit, :update, :destroy]
  #before_action :correct_user, only: [:edit, :update, :destroy]
  #before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @tiles = Tile.all
    respond_with(@tiles)
  end

  def show
    respond_with(@tile)
  end

  def new
    @tile = current_user.tiles.build
  end

  def edit
  end

  def create
    @tile = current_user.tiles.build(tile_params)
    if @tile.save
      redirect_to @tile, notice: "Tile was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @tile.update(tile_params)
      redirect_to @tile, notice: "Tile was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @tile.destroy
    respond_with(@tile)
  end

  private
    def set_tile
      @tile = Tile.find(params[:id])
    end

    #def correct_user
     #@tile = current_user.tiles.find_by(id: params[:id])
     #redirect_to tiles_path, notice: "Not authorized to edit this tile" if @tile.nil?
    #end

    def tile_params
      params.require(:tile).permit(:description, :image)
    end
end
