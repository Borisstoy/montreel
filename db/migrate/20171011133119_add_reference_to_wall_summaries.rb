class AddReferenceToWallSummaries < ActiveRecord::Migration[5.1]
  def change
    add_reference :wall_summaries, :place
  end
end
