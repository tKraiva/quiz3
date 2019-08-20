class Bid < ApplicationRecord
    belongs_to :auction
    belongs_to :user
    validates :bid_amt, presence: true
    validates_numericality_of :bid_amt
end
