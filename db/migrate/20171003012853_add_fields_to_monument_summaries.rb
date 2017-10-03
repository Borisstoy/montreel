class AddFieldsToMonumentSummaries < ActiveRecord::Migration[5.1]
  def change
    add_column :monument_summaries, :park, :string
    add_column :monument_summaries, :building, :string
    remove_column :monument_summaries, :description
  end
end
