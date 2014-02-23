class AddPhotoLinkToImage < ActiveRecord::Migration
  def change
    add_column :images, :photolink, :string
  end
end
