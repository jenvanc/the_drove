class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :author_id, foreign_key: true
      t.integer :receiver_id, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
