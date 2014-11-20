class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.boolean :sticky, default: false, null: false
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
