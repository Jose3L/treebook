class Status < ActiveRecord::Base
	# relación de pertenecer a un único usuario
	belongs_to :user
end
