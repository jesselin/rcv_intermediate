class Product < ActiveRecord::Base
	validates :name, :description, :pricing, :category_id, presence: true
	belongs_to :category
end
