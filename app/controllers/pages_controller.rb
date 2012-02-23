class PagesController < InheritedResources::Base
    def new
        @page = Page.new(:parent_id => params[:parent_id])
    end
    
    def home
        @title = "Home"
        @articles = Article.find(:all, :limit => 3, :conditions => { :frontpage=> "t", :visible => "t" })
    end
end
