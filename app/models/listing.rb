class Listing < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  belongs_to :account
end
