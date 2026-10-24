class CreateMemberships < ActiveRecord::Migration[8.1]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :artist_space, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
