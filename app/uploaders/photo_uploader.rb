class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  private
    def shrink(size)
      manipulate! do |img|
        w,h = img['%w %h'].split
        w = w.to_f
        h = h.to_f

       if (w > size || h > size)
          if (w > h)
            h = (h*(size/w)).to_i
            w = size
          else
            w = (w*(size/h)).to_i
            h = size
          end
          img.resize "#{w}x#{h}"
        end
       img
      end
  end 
end
