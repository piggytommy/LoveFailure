 class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name
  field :content 

  belongs_to :story
end
