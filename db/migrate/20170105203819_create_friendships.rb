class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :sender_id, foreign_key: true
      t.integer :acceptor_id, foreign_key: true
      t.boolean :accepted?, default: false

      t.timestamps
    end
  end
end
