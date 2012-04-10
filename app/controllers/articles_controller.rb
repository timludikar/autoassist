class ArticlesController < InheritedResources::Base
    
    load_and_authorize_resource
    
    def new
      @article = Article.new
      1.times do
        image = @article.images.build
      end
    end
    
    def index
        @title = "News"
        @article = Article.find(:all, :conditions => {:category => params[:category]})
    end
    
    def create
        @user = current_user
        @articles = @user.articles.create(params[:article])
        redirect_to article_path(@articles)
    end
    
    def mercury_update
        article = Article.find(params[:id])
        article.name = params[:content][:article_title][:value]
        article.content = params[:content][:article_content][:value]
        article.save!
        render :text => ""
    end
    
    def show
      if params[:category].nil?
        @articles = Article.find(params[:id])
      else
        @articles = Article.find(params[:id], :conditions => {:category => params[:category]})
      end
      @title = @articles.category.capitalize
    end
    
    def edit
      1.times do
        image = @article.images.build
      end  
    end
    
    def update
      @article = Article.find(params[:id])
      if @article.update_attributes(params[:article])
        with_action do |a|
          a.save
          a.remove
          a.any do
            redirect_to :action => 'show', :id => @article
          end
        end
      else
        @subjects = Subject.find(:all)
        render :action => 'edit'
      end
    end
    
    def save
      redirect_to edit_article_image_path(@article.id, @article.thumbnail_id) 
    end
    
end
