class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.string :address
      t.string :city
      t.string :state
      t.string :description
      t.integer :zipcode
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
