class PhotosController < ApplicationController
  def new_story_cover
   params[:file] = file_handler(params)
   @photo = StoryCover.new(params)
   @photo.save
   respond_to do |format|
     format.json{ render(:layout => false , :json => {"success" => true, "data" => @photo}.to_json )}
   end
  end

  def new_default_story_cover
    params[:file] = file_handler(params)
    @photo = SiteDefaultStoryCover.new(params)
    @photo.save
    respond_to do |format|
      format.json{ render(:layout => false , :json => {"success" => true, "data" => @photo}.to_json )}
    end
  end

  private
  def file_handler(params)
      # get file name
      file_name =  params[:qqfile]
      # get file content type
      att_content_type = (request.content_type.to_s == "") ? "application/octet-stream" : request.content_type.to_s
      # create tempora##l file
      begin
        file = Tempfile.new(file_name, {:encoding =>  'BINARY'})
        file.print request.raw_post.force_encoding('BINARY')
      rescue RuntimeError => e
        raise e unless e.message.include?('cannot generate tempfile')
        file = Tempfile.new(file_name) # Ruby 1.8 compatibility
        file.binmode
        file.print request.raw_post
      end
      # put data into this file from raw post request

      # create several required methods for this temporal file
      Tempfile.send(:define_method, "content_type") {return att_content_type}
      Tempfile.send(:define_method, "original_filename") {return file_name}
      file
  end  

end
