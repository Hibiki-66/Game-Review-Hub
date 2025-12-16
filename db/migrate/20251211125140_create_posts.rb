class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.string :review_title
      t.string :game_title
      t.text :body
      t.integer :review
      t.timestamps
    end
  end
end
