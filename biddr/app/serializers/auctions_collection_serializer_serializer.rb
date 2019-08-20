class AuctionsCollectionSerializerSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :description,
    :current_price,
    :rsv_price,
    :auction_end,
    :created_at
    )
end
