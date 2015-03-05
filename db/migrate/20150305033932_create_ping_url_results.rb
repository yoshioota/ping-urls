class CreatePingUrlResults < ActiveRecord::Migration
  def change
    create_table :ping_url_results do |t|
      t.references :ping_url, index: true
      t.text :response_body

      t.timestamps null: false
    end
    add_foreign_key :ping_url_results, :ping_urls
  end
end
