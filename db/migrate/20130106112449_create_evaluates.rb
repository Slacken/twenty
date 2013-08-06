class CreateEvaluates < ActiveRecord::Migration
  def change
    create_table :evaluates do |t|
      t.integer :user_id
      t.integer :post_id
      t.decimal :value

      t.timestamps
    end
  end
end
