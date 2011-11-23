class SiteDefaultPhotoUploader < PhotoUploader 
  def store_dir
    "images/story_default_imgs" 
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
