class AuctionSerializer < ActiveModel::Serializer
      # To include associated models, use the same
    # named methods for creating associations. You
    # can rename the association with `key:` which is
    # only to show in the rendered json.
    belongs_to(:user, key: :author)
    has_many(:bids)

     # You can create methods inside a serializer to
    # include custom data in the json serialization.
    # When doing so, make sure to incude the name of
    # the method in the attributes call.
  




     class BidSerializer < ActiveModel::Serializer
      attributes :id, :bid_amt, :date_of_bid, :created_at, :updated_at

       belongs_to :user, key: :author
    end
end
