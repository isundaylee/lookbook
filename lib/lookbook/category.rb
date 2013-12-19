require 'active_record'

class Category < ActiveRecord::Base

  validates :title, presence: true

  belongs_to :parent, class_name: 'Category'
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

end