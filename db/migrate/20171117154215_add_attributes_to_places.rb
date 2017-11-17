class AddAttributesToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :collection_name_fr, :string
    add_column :places, :collection_name_en, :string
    add_column :places, :category_fr, :string
    add_column :places, :category_en, :string
    add_column :places, :sub_category_fr, :string
    add_column :places, :sub_category_en, :string
    add_column :places, :materials_fr, :string
    add_column :places, :materials_en, :string
    add_column :places, :tech_fr, :string
    add_column :places, :tech_en, :string
    add_column :places, :artist_name, :string
    add_column :places, :artist_last_name, :string
    add_column :places, :park, :string
    add_column :places, :building, :string
    add_column :places, :type, :string
    add_column :places, :artist, :string
    add_column :places, :organisation, :string
    add_column :places, :year, :string
    add_column :places, :program, :string
    add_column :places, :image, :string
  end
end
