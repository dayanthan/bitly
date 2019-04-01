class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :base_url
      t.text :short_url
      t.integer :count, :default => 0

      t.timestamps
    end
  end
end
