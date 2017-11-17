class RemoveWallSummariesAndMonumentSummaries < ActiveRecord::Migration[5.1]
  def change
    drop_table :monument_summaries
    drop_table :wall_summaries
  end
end
