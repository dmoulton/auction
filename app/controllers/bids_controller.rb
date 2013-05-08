class BidsController < ApplicationController
  def create
    bid = Bid.new(params[:bid])
    respond_to do |format|
      if bid.save
        format.json { render json: bid, status: :created, location: bid }
      else
        format.json { render json: bid.errors, status: :unprocessable_entity }
      end
    end
  end
end
