class ArticlesController < InheritedResources::Base
<<<<<<< HEAD
<<<<<<< HEAD
    load_and_authorize_resource
    def index
        @title = "News"
        #@articles = Article.find(:all)
=======
    
    load_and_authorize_resource
    
    def index
        @title = "News"
>>>>>>> Rails3.1Update
=======
    
    load_and_authorize_resource
    
    def index
        @title = "News"
>>>>>>> Rails3.1Update
    end
    
    def create
        @user = current_user
        #@articles = @user.articles.create(params[:article])
        redirect_to article_path(@articles)
    end
end
