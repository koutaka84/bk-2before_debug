class RemovePhotoIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :photo_id, :string
  end
end
