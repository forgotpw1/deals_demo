# This migration comes from deals (originally 20121212015129)
class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
