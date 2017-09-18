namespace :mtl_data do
  desc "Import mtl cultural places"
  task import_mtl_data: :environment do
    require 'csv'

    puts "Dumping & Reseting Place table IDs"

    ActiveRecord::Base.connection.reset_pk_sequence!('places')

    puts "Parsing CSV"

    csv = Dir["db/data/*"].first

    CSV.foreach(csv, headers: true ) do |row|


      pl = Place.new
      pl.borough = row[0]
      pl.kind = row[1]
      pl.name = row[2]
      pl.address = row[3]
      pl.zip = row [4]
      pl.city = row[5]
      pl.province = row[6]
      pl.phone = row[7]
      pl.website = row[8]
      pl.lng = row[9]
      pl.lat = row[10]
      pl.description = row[11]
      pl.save
    end
  end
end

