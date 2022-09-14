class AddAvalabilityAndRemoveColosingTimeFromShops < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :closing_time, :string
    add_column :shops, :avalability, :boolean, default: false
  end
end
