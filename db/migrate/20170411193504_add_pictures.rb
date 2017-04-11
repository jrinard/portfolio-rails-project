class AddPictures < ActiveRecord::Migration[5.0]
  def change
    add_attachment :projects, :image
  end
end
