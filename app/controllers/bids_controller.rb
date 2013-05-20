class BidsController < ApplicationController
  def create
    bid = Bid.new(params[:bid])
    respond_to do |format|
      if bid.save
        higher,lower = bid.item.top_two
        AuctionMailer.outbid(lower,higher).deliver
        format.json { render json: bid, status: :created, location: bid }
      else
        format.json { render json: bid.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @bids = Bid.all
    respond_to do |format|
        format.json
        format.html
    end
  end
end
