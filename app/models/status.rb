class Status < ActiveRecord::Base
	# relación de pertenecer a un único usuario
	belongs_to :user

	validates :content, presence: true,
					  	length: { minimum: 2 }

	validates :user_id, presence: true
end
