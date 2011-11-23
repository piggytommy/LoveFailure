class Story
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :description, :type => String
  field :type, :type => Integer
  field :private, :type => Boolean, :default => true 
  field :image_url, :type => String
  field :image_medium_url, :type => String
  field :image_small_url, :type => String
  field :image_large_url, :type => String

  has_many :articles

  def initialize(*args)
    super(*args) 
    random_cover = Photo.random_story_cover
    puts '*******'
    puts '*******'
    puts '*******'
    unless args.length > 0
      self.image_url = random_cover.image_url
      self.image_medium_url = random_cover.image_url(:medium)
      self.image_small_url = random_cover.image_url(:small)
      self.image_large_url = random_cover.image_url(:large)
    end
  end
end
