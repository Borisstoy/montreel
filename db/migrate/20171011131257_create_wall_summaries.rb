class CreateWallSummaries < ActiveRecord::Migration[5.1]
  def change
    create_table :wall_summaries do |t|
      t.string :type
      t.string :artist
      t.string :organisation
      t.string :year
      t.string :program
      t.string :image

      t.timestamps
    end
  end
end
