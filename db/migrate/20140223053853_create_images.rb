class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :photo
      t.string :url
      t.text :text

      t.timestamps
    end
  end
end
