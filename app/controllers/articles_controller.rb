class ArticlesController < InheritedResources::Base
    load_and_authorize_resource
    def index
        @title = "News"
        #@articles = Article.find(:all)
    end
    
    def create
        @user = current_user
        #@articles = @user.articles.create(params[:article])
        redirect_to article_path(@articles)
    end
end
