class AuctionSerializer < ActiveModel::Serializer
  
  attributes(
    :id,
    :title,
    :description,
    :current_price,
    :rsv_price,
    :auction_end,
    :created_at
    )

    belongs_to(:user, key: :author)
    has_many(:bids)

     class BidSerializer < ActiveModel::Serializer
      attributes :id, :bid_amt, :date_of_bid, :created_at, :updated_at

       belongs_to :user, key: :author
    end
end
