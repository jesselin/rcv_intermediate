class Comment < ActiveRecord::Base
	validates :author, :content, :product_id, presence: true
	belongs_to :product
end
