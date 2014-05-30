class Item < ActiveRecord::Base
	has_many :subcategories, dependent: :destroy
	validates :name, presence: true
end
