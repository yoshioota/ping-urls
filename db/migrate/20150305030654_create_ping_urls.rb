class CreatePingUrls < ActiveRecord::Migration
  def change
    create_table :ping_urls do |t|
      t.text :url

      t.timestamps null: false
    end
  end
end
