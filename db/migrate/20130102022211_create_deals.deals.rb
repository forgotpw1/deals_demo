# This migration comes from deals (originally 20121212014610)
class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :first_line
      t.string :second_line
      t.text :description
      t.string :email
      t.string :phone
      t.string :website
      t.float :commission
      t.datetime :deleted_at
      t.references :place
      t.references :category

      t.timestamps
    end
    add_index :deals, :place_id
    add_index :deals, :category_id
  end
end
