class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :user

      t.timestamps
    end

    #sample post
    User.first.posts.create(:title => "Hello World", :text => "My first blog post.")
  end

  def self.down
    drop_table :posts
  end
end

