class ArticlesController < InheritedResources::Base
    
    load_and_authorize_resource
    
    def index
        @title = "News"
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
end
