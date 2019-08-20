class BidsController < ApplicationController
    before_action :authenticate_user!

  def create
    @auction = Auction.find(params[:auction_id])
    @bid = Bid.new bid_params
    @bid.auction = @auction
    @bid.user = current_user
    if @bid.save
      redirect_to auction_path(@auction)
    else
      # For the list of answers
      @bids = @auction.bids.order(created_at: :desc)
      render 'auctions/show'
    end
  end

  def destroy
    @bid = Bid.find params[:id]
    if can?(:crud, @answer)
      @bid.destroy
      redirect_to auction_path(@bid.auction)
    else

      head :unauthorized

    end
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_amt, :date_of_bid)
  end
end
