# This migration comes from deals (originally 20121212015114)
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
