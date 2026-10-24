class CreateArtistSpaces < ActiveRecord::Migration[8.1]
  def change
    create_table :artist_spaces do |t|
      t.string :artist_name
      t.text :bio
      t.string :website_url
      t.string :social_media_url
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
