class CreateMonumentSummaries < ActiveRecord::Migration[5.1]
  def change
    create_table :monument_summaries do |t|
      t.string :collection_name_fr
      t.string :collection_name_en
      t.string :category_fr
      t.string :category_en
      t.string :sub_category_fr
      t.string :sub_category_en
      t.string :materials_fr
      t.string :materials_en
      t.string :tech_fr
      t.string :tech_en
      t.string :artist_name
      t.string :artist_last_name
      t.string :description

      t.timestamps
    end
  end
end
