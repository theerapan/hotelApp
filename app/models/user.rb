class User < ApplicationRecord
	has_many :rooms
	validates :first_name, presence: true
end
