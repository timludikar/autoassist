class ImagesController < InheritedResources::Base
  def update
    @images = Image.find(params[:id])
    crop_params = "#{params[:w]}x#{params[:h]}+#{params[:x]}+#{params[:y]}"
    resize_params = "304x240"  
        
    image = MiniMagick::Image.open(@images.photo.path)
    image.crop(crop_params)
    image.thumbnail(resize_params)
    image.write(@images.photo.path(:thumbnail))
    
    redirect_to edit_article_path(params[:article_id])
  end
  
  def thumbnail
    @image = Image.find(params[:image_id])
    respond_to do |format|
      format.html { redirect_to edit_article_path(params[:article_id]) }
      format.js
    end
  end
  
end
