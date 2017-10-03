class AddReferenceToMonumentSummaries < ActiveRecord::Migration[5.1]
  def change
    add_reference :monument_summaries, :place
  end
end
