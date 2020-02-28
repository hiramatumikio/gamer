class AddProfileimageidToPublics < ActiveRecord::Migration[5.2]
  def change
    add_column :publics, :profile_image_id, :string
  end
end
