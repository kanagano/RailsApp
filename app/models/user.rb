class User < ApplicationRecord
	has_secure_password
	validates :name, {presence: true}
	validates :place, {presence: true}
	validates :email, {presence: true}
	validates :password, {presence: true}
end
