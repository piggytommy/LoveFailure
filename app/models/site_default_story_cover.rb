class SiteDefaultStoryCover < Photo
  mount_uploader :image, SiteDefaultPhotoUploader 

  def initialize(params={})
    super(params)
  end

end

