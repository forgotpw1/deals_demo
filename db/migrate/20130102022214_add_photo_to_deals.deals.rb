# This migration comes from deals (originally 20121218023245)
class AddPhotoToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :photo, :string
  end
end
