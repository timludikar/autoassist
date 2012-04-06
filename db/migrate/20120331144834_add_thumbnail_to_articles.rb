class AddThumbnailToArticles < ActiveRecord::Migration
  def change
      add_column :articles, :thumbnail_id, :integer, :default => "0"
  end
end
