class Photo < ActiveRecord::Base

	belongs_to :photoable, polymorphic: true

	has_attached_file :image_file, :styles => { :medium => "300x300>", :thumb => "100x100>" }, bucket: ENV['aws_bucket']
  validates_attachment_content_type :image_file, :content_type => /\Aimage\/.*\Z/
end
