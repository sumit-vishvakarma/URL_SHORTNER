class CreateShortUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :short_urls do |t|
      t.string :long_url
      t.string :short_code

      t.timestamps
    end
    add_index :short_urls, :short_code
  end
end
