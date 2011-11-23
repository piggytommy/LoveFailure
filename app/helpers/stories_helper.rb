module StoriesHelper
  def story_avatar(photo)
    unless photo.nil?
      photo.image_url(:medium)
    else
      "/images/story_default_imgs/#{1+rand(17)}.jpg"
    end 
  end
end
