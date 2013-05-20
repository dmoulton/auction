class AuctionMailer < ActionMailer::Base
  default from: AUCTION_EMAIL

  def outbid(lower_bid, higher_bid)
    @new_high = higher_bid
    @old_high = lower_bid

    mail(:to => lower_bid.email, :subject => "You have been outbid!")
  end

  def highbid(bid)
    @bid = bid

    mail(:to => bid.email, :subject => "You are the high bidder")
  end
end
