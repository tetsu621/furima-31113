class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,    null: false
      t.integer    :area_id,        null: false
      t.string     :municipality,   null: false
      t.string     :address,        null: false
      t.string     :building_name
      t.string     :phone_number,   null: false
      t.references :order,          null: false
      t.timestamps
    end
  end
end
