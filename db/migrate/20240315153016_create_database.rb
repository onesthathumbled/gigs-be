class CreateDatabase < ActiveRecord::Migration[7.1]
  def change
    create_table :gigs do |t|
      t.references :seller, foreign_key: { to_table: :users }
      t.string :title
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :delivery_time
      t.references :category, foreign_key: true
      t.string :tags
      t.timestamps
    end
  end
end
