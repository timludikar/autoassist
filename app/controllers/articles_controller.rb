class ArticlesController < InheritedResources::Base
    
    load_and_authorize_resource
    
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
        @article = Article.find(params[:id])
      else
        @article = Article.find(params[:id], :conditions => {:category => params[:category]})
      end
      @title = @article.category.capitalize
    end

end
