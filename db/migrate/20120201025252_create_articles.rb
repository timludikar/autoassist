class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.references :user

      t.timestamps
    end
add_index :articles, :user_id
  end

  def self.down
    drop_table :articles
  end
end
