class ImagesController < InheritedResources::Base
  
  require 'json'
  
  def index
    @images = Image.all
    #@upload = Image.new
    respond_to do |format|
      format.html
      format.json {render :json => @images.collect { |p| p.to_jq_upload }.to_json}
    end
  end
  
  def show
    @images = Image.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @images.as_json }
    end
  end
  
  def create
    @images = Image.new(params[:image])
      if @images.save
          render :json => @images.to_jq_upload.as_json
      else
          @images = Image.all
          render :action => 'index'
      end
   end
  
  def destroy
    image = Image.find(params[:id])
    if image.article_id != nil then
      article = Article.find(image.article_id)
      article.thumbnail_id = nil
      article.save
    end
    image.destroy
    respond_to do |format|
      format.js { render :js => "removeItem(" + params[:id] + ")"}
    end
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
  
  def show_image
    @image = Image.find(params[:image_id])
    respond_to do |format|
      format.js
    end
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
  
  def add
    @image = Image.find(params[:image_id])
    @image.article_id = params[:article_id]
    @image.save
    respond_to do |format|
      format.html { redirect_to edit_article_path(params[:article_id])}
      format.js
    end
  end
  
  def multiple_delete
    @images = Image.find(params[:image_ids])
    @images.each do |image|
      if image.article_id != nil then
        article = Article.find(image.article_id)
        article.thumbnail_id = nil
        article.save
      end
      image.destroy
    end
    #respond_to do |format|
    #  format.js { render :js => "removeItem(" + params[:id] + ")"}
    #end
    redirect_to images_path
  end
end
