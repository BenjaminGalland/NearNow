class AddInfosToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :age, :integer
    add_column :users, :location, :string
    add_column :users, :description, :text
  end
end
