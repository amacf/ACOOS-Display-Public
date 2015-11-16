class Person < ActiveRecord::Base
	has_attached_file :image, styles: {large:"800", medium:"600", small:"300", thumb:"100"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates_attachment :image, size: { in:0..800.kilobytes }
	
end
