class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.boolean :active, default: false, null: false

      t.timestamps null: false
    end
  end
end
