class Auction < ApplicationRecord
    belongs_to :user
    has_many :bids, dependent: :destroy
    

    validates(
        :title, 
        presence: true, 
        uniqueness: {case_sensitive: false} 
    )
        
    validates(
        :description, 
        presence: true
    )
            
    validates(
        :current_price, 
        presence: true,
                
    )
            
    validates(
        :auction_end, 
        presence: true         
    )
    validates(
        :rsv_price, 
        presence: true         
    )
    validates_numericality_of :bid_amt, :current_price, :rsv_price          
end
