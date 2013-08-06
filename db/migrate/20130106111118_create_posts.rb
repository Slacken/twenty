class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.decimal :weight, :default => 0
      t.string :author
      t.string :source
      t.string :pubtime
      t.decimal :like, :default => 0
      t.decimal :dislike, :default => 0
      t.decimal :neutral, :default => 0
      t.string :title
      t.text :content
    end
  end
end
