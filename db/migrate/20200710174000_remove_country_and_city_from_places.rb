class RemoveCountryAndCityFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :country, :string
    remove_column :places, :city, :string
  end
end
