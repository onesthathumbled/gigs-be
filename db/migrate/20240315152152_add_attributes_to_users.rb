class AddAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_picture, :string
    add_column :users, :bio, :text
    add_column :users, :join_date, :date
    add_column :users, :last_login_date, :datetime
    add_column :users, :role, :string
  end
end
