class ImagesController < InheritedResources::Base
  def destroy
    image = Image.find(params[:id])
    article = Article.find(image.article_id)
    article.thumbnail_id = nil
    article.save
    image.destroy
    redirect_to images_path
  end
  
  def update
    @images = Image.find(params[:id])
    crop_params = "#{params[:w]}x#{params[:h]}+#{params[:x]}+#{params[:y]}"
    resize_params = "304x240"  

    imageCommand = Thread.new do
      image = MiniMagick::Image.open(@images.photo.path)
      image.crop(crop_params)
      image.thumbnail(resize_params)
      image.write(@images.photo.path(:thumbnail))
    end
    imageCommand.join
    redirect_to edit_article_path(@images.article_id)
  end
  
  def thumbnail
    @image = Image.find(params[:image_id])
    respond_to do |format|
      format.html { redirect_to edit_article_path(params[:article_id]) }
      format.js
    end
  end
  
  def remove
    @image = Image.find(params[:image_id])
    @image.article_id = nil
    @image.save
    respond_to do |format|
      format.html { redirect_to edit_article_path(params[:article_id]) }
      format.js 
    end
  end
end
