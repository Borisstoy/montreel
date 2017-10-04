class Place < ApplicationRecord
  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode

  has_one :monument_summary

  accepts_nested_attributes_for :monument_summary
end
