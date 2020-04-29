class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
    	t.text :name
    	t.text :artist
    	t.text :image
    	t.integer :votes

      	t.timestamps
    end
    add_index :albums, [:name, :artist], unique: true
  end
end
