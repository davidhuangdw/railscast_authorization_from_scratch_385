class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :topic, index: true
      t.text :content
      t.boolean :inline_images

      t.timestamps
    end
  end
end
