class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :description
      t.string :color
      t.boolean :status
      t.text :link
      t.integer :user_id
      t.integer :order

      t.timestamps
    end
  end
end
