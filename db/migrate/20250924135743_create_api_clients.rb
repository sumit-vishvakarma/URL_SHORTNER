class CreateApiClients < ActiveRecord::Migration[7.2]
  def change
    create_table :api_clients do |t|
      t.string :name
      t.string :token

      t.timestamps
    end
    add_index :api_clients, :token
  end
end
