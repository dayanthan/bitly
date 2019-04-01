class CreateTrackUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :track_urls do |t|
      t.integer :post_id
      t.text :ip_address
      t.string :location

      t.timestamps
    end
  end
end
