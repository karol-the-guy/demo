class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
