class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  #emailの一意性を検証する
  def change
    add_index :users, :email,unique: true
  end
end
