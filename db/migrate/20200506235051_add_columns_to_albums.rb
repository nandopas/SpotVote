class AddColumnsToAlbums < ActiveRecord::Migration[6.0]
  def change
  	add_column :albums, :type, :text
  	#add genres as an array
  	add_column :albums, :genres, :text, array: true, default: []
  	add_column :albums, :release_date, :text
  	add_column :albums, :total_tracks, :integer
  end
end
