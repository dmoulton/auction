namespace :db do
  desc "remove all bids"
  task :bid_reset => :environment do
    if Date.today < Date.new(2013,6,30)
      Bid.delete_all
      puts "All bids have been removed"
    else
      puts "The auction has started, can't remove bids this way"
    end
  end
end