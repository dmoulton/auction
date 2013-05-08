class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    #render json: Item.all.as_json(only: [:name,:description, :image_url, :min_bid, :min_increment, :max_bid])
    @items = Item.all
  end

  # GET /items/:id
  # GET /items/:id.json
  def show
    render json: Item.find(params[:id])
  end
end
