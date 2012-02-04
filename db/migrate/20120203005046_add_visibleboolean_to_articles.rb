class AddVisiblebooleanToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :visible, :boolean, :default => "t"
  end

  def self.down
    remove_column :articles, :visible
  end
end
