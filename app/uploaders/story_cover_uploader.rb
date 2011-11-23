class StoryCoverUploader < PhotoUploader 
  def store_dir 
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

 version :small do
    process :convert => 'jpg'
    process :resize_to_fill=> [80,80] 
  end

  version :medium do
    process :convert => 'jpg'
    process :resize_to_fill=> [130,130] 
  end

  version :large do
    process :convert => 'jpg'
    process :resize_to_fill=> [150,150] 
  end
end
