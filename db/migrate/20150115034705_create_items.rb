class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :place
      t.string :time
      t.string :walker
      t.string :director
      t.string :video

      t.timestamps
    end
  end
end
