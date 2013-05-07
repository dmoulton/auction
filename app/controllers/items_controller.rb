class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    render json: Item.all
  end

  # GET /items/:id
  # GET /items/:id.json
  def show
    render json: Item.find(params[:id])
  end
end
