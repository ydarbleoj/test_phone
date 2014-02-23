class AddUrlToImages < ActiveRecord::Migration
  def change
    add_column :images, :aws_url, :text
  end
end
