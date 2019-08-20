class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.integer :current_price
      t.date :auction_end
      t.integer :rsv_price
      t.text :description
      t.text :title

      t.timestamps
    end
  end
end
