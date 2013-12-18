require 'active_record'

class Product < ActiveRecord::Base
  has_many :style
end