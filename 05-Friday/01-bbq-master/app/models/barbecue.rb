class Barbecue < ActiveRecord::Base
  validates :title, presence: true
  validates :venue, presence: true
  validates :date, presence: true

  has_many :interims
  has_many :users, through: :interims
  has_many :items
  
end
