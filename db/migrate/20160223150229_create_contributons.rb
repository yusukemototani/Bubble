class CreateContributons < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.string :title
      t.string :body
      t.string :img
      t.string :good
      t.timestamps null: false
    end
  end
end
