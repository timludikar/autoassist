class PagesController < ApplicationController
    def home
        @title = "Home"
        @articles = Article.find(:all, :limit => 3, :conditions => { :frontpage=> "t", :visible => "t" })
    end
end
