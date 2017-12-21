class UpdateUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :name, :string
    remove_column :users, :email, :string
    add_column :users, :username, :string, null: false

    add_index :users, :username, unique: true
  end
end
