class BidsController < ApplicationController
  def create
    bid = Bid.new(params[:bid])
    bid.ip_address = env['REMOTE_ADDR']
    respond_to do |format|
      if bid.save
        higher,lower = bid.item.top_two
        AuctionMailer.outbid(lower,higher).deliver unless lower.nil? || lower.email.nil?
        AuctionMailer.highbid(higher).deliver unless higher.email.nil?
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
