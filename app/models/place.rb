class Place < ApplicationRecord
  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode

  has_one :monument_summary
  has_one :wall_summary

  accepts_nested_attributes_for :monument_summary
  accepts_nested_attributes_for :wall_summary

  scope :find_by_kind, -> (kind) { where(kind: kind).order('name ASC') }
  scope :monument_by_category, -> (category) { joins(:monument_summary).where(kind: 'Monument')
                                                                       .where(monument_summaries: {sub_category_fr:  category})
                                                                       .order('name ASC')}
end
