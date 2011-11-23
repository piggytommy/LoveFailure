class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :image, :type => String
  field :is_default, type: Boolean, default: false   

  attr_accessible :image
  scope :default_photos, where(:is_default => true).desc('created_at')

  def initialize(params = {})
    super
    image_file = params[:file] 
    default = params[:is_default]
    self.is_default = true if default
    self.image.store!(image_file)
  end

  def self.random_story_cover
    @photos = self.default_photos
    @photos[rand(@photos.length)]
  end

  def as_json(opts={})
    {
      :photo => {
        :id => self.id,
        :url => self.image_url,
        :small => self.image_url(:small),
        :medium => self.image_url(:medium),
        :large => self.image_url(:large),
      }
    }
  end 

end
