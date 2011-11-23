class SiteAdminController < ApplicationController
  def site_story_photos 
    @photos = Photo.default_photos 
  end
end
