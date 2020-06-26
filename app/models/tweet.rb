class Tweet < ApplicationRecord
	belongs_to :user

	validates :user, presence: true
	validates :conteudo, presence: true, length: {maximum: 140}

	has_attached_file :photo, :styles => {:small => "150x150"}
	do_not_validate_attachment_file_type :photo
	
	
end
