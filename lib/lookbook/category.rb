require 'active_record'

class Category < ActiveRecord::Base

  validates :title, presence: true
  validates :name, presence: true
  validate  :name_cannot_contain_whitespaces
  validates :name, uniqueness: {scope: :parent_id}

  belongs_to :parent, class_name: 'Category'
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

  def self.find_by_path(path)

  end

  private

    def name_cannot_contain_whitespaces
      if name && /\s/ =~ name
        errors.add(:name, 'can\'t contain whitespaces. ')
      end
    end

end