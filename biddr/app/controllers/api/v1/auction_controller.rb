class Api::V1::AuctionController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_auction, only: [:show, :destroy]

  rescue_from(ActiveRecord::RecordNotFound, with: :record_not_found)
  rescue_from(ActiveRecord::RecordInvalid, with: :record_invalid)


   def index
    @auctions = Auction.order(created_at: :desc)
    render(json: @auctions, each_serializer: AuctionsCollectionSerializer)
  end

   def show
    if @auction
      render(
        json: @auction,
        # We need to do this to make sure that Rails
        # includes the nested user association for answers
        # (which is renamed to author in the serializer).
        include: [ :author, {bids: [ :author ]} ]
      )
      else
        render(json: {error: 'Auction Not found'})
    end
  end

   def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    @auction.save!
    render json: { id: auction.id }
  end

   def destroy
    @auction.destroy
    render(json: { status: 200 }, status: 200)
  end

   private

   def find_auction
    @auction ||= Auction.find params[:id]
  end

   def auction_params
    params.require(:auction).permit(:title, :description, :current_price, :auction_end, :rsv_price)
  end

  def record_not_found
    render(
      json: { status:422, errors: {msg: 'Record Not Found'}},
      status: 422
    )
  end

   def record_invalid(error)
    invalid_record = error.record
    errors = invalid_record.errors.map do |field, message|
      {
        type: error.class.to_s,
        record_type: invalid_record.class.to_s,
        field: field,
        message: message,
      }
    end
    render(
      json: { status:422, errors: errors }
    )
    end
end
