class CreateRsses < ActiveRecord::Migration
  def change
    create_table :rsses do |t|
      t.string :name
      t.decimal :weight, :default=>1
      t.string :home
      t.string :url, :null=>false

      t.timestamps
    end
  end
end
