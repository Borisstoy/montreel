class MonumentSummary < ApplicationRecord
  belongs_to :place
  validates :place, presence: true
end
