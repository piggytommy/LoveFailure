class StoryCover < Photo
  mount_uploader :image, StoryCoverUploader

  def initialize(params={})
    super(params)
  end

end
