class ChangeAlbumsTable < ActiveRecord::Migration[6.0]
  def change
  	remove_column :albums, :type, :string
  	add_column :albums, :album_type, :string
  end
end
