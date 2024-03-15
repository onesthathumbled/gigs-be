class AddForeignKeysToTables < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :gigs, :users, column: :seller_id
    add_foreign_key :gigs, :categories
    add_foreign_key :orders, :users, column: :buyer_id
    add_foreign_key :orders, :users, column: :seller_id
    add_foreign_key :orders, :gigs
    add_foreign_key :orders, :reviews
    add_foreign_key :reviews, :orders
    add_foreign_key :messages, :users, column: :sender_id
    add_foreign_key :messages, :users, column: :receiver_id
    add_foreign_key :notifications, :users
    add_foreign_key :withdrawals, :users, column: :seller_id
    add_foreign_key :reports, :users, column: :reporter_id
    add_foreign_key :reports, :users, column: :reported_id
    add_foreign_key :favorites, :users
    add_foreign_key :favorites, :gigs
    add_foreign_key :sessions, :users
  end
end
