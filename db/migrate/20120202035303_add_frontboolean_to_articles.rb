class AddFrontbooleanToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :frontpage, :boolean, :default => "t"
  end

  def self.down
    remove_column :articles, :frontpage
  end
end
