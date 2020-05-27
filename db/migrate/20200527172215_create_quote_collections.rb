class CreateQuoteCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_collections do |t|
      t.string :user_id
      t.string :quote_id

      t.timestamps
    end
    add_index :quote_collections, :user_id
    add_index :quote_collections, :quote_id
  end
end
