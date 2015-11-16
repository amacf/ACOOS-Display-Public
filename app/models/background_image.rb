class BackgroundImage < ActiveRecord::Base
	has_attached_file :image, styles: { small: "500",large: "1280x1024" }
validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
validates_attachment :image, size: { in:0..10000.kilobytes }
validate :image_dimensions

  private

  def image_dimensions
    required_width  = 1280
    required_height = 1024
    dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)

    errors.add(:image, "Width must be #{required_width}px") unless dimensions.width == required_width
    errors.add(:image, "Height must be #{required_height}px") unless dimensions.height == required_height
  end

end
