class AddThumbnailToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :thumbnail_id, :integer
  end
end
