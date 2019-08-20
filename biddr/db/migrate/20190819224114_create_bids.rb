class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer :bid_amt
      t.date :date_of_bid

      t.timestamps
    end
  end
end
