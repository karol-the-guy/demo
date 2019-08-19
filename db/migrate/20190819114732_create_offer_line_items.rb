class CreateOfferLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :offer_line_items do |t|
      t.references :offer, foreign_key: true
      t.references :line_item, foreign_key: true

      t.timestamps
    end
  end
end
