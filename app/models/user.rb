class User < ActiveRecord::Base
	has_secure_password
	validates :name, presence: true

	has_many :reviews
	has_many :products, through: :reviews

	 has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
	 validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end