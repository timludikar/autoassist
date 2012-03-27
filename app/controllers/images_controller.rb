class ImagesController < ApplicationController
  def edit
    @images = Image.find(params[:id])
    session[:return_to] ||= request.referer
  end
  
  def update
    
    @images = Image.find(params[:id])
    crop_params = "#{params[:w]}x#{params[:h]}+#{params[:x]}+#{params[:y]}"    
        
    image = MiniMagick::Image.open(@images.photo.path)
    image.crop(crop_params)
    image.write(@images.photo.path(:thumbnail))
    
    redirect_to session[:return_to]
  end
end
