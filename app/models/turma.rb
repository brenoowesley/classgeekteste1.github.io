class Turma < ApplicationRecord

	has_and_belongs_to_many :users

	has_attached_file :image, styles: { medium: "150x150>", thumb: "100x100>", small: "150x150>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
