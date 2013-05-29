class Upload
  require 'carrierwave/orm/mongomapper'
  include MongoMapper::Document

  key :name, String
  mount_uploader :image, ImageUploader
  attr_accessible :image,:name,:remote_image_url
end
