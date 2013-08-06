class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :user_id
      t.string :value
      t.decimal :count

      t.timestamps
    end
  end
end
