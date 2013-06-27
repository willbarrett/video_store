class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.date :publication_date, null: false
      t.attachment :video
      t.attachment :preview
      t.timestamps
    end
  end
end
