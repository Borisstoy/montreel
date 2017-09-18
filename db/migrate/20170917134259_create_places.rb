class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :borough
      t.string :kind
      t.string :name
      t.string :address
      t.string :zip
      t.string :zip
      t.string :city
      t.string :province
      t.string :phone
      t.string :website
      t.string :lng
      t.string :lat
      t.string :description

      t.timestamps
    end
  end
end
