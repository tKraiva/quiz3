class User < ApplicationRecord

    has_many :auctions, dependent: :nullify
    has_many :bids, dependent: :nullify

    has_secure_password


    validates :email, presence: true, uniqueness: true
    validates :f_name, :l_name, presence: true

    


    def full_name
        "#{f_name} #{l_name}".strip
    end
end
