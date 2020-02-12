class Post < ApplicationRecord
	validates :price, {presence: true}
	validates :name, {presence: true}
	validates :period, {presence: true}
	validates :user_id, {presence: true}
end
