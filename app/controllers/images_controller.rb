class ImagesController < ApplicationController
  def edit
    @images = Image.find(params[:id], :order => 'position')
  end
  
  def update
    @images = Image.find(params[:id])
    crop_params = "#{params[:w]}x#{params[:h]}+#{params[:x]}+#{params[:y]}"    
        
    image = MiniMagick::Image.open(@images.photo.path)
    image.crop(crop_params)
    image.write(@images.photo.path(:thumbnail))
    
    redirect_to edit_article_path(@images.article_id)
  end
end
