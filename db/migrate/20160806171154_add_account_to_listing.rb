class AddAccountToListing < ActiveRecord::Migration
  def change
    add_reference :listings, :account, index: true, foreign_key: true
  end
end
