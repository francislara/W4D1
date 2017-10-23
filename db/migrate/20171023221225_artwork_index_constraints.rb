class ArtworkIndexConstraints < ActiveRecord::Migration[5.1]
  def change
    add_index :artworks, [:artist_id]
    change_column :artworks, :artist_id, :integer, null: false
    change_column :artworks, :title, :string, null: false
    change_column :artworks, :image_url, :string, null: false
  end
end
