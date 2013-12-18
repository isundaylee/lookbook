require 'active_record'

class Style < ActiveRecord::Base
  validates :title, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :current_price, numericality: {greater_than_or_equal_to: 0}

  belongs_to :product
end