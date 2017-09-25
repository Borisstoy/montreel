namespace :mtl_data do
  desc "Run all rake tasks"
  task run_all: [:environment, 'mtl_data:reset_places',
                               'mtl_data:import_cult_places',
                               'import_monuments']

  desc "Import mtl cultural places"

  task reset_places: :environment do
    puts "Destroying all Places"
    Place.destroy_all

    puts "Dumping & Reseting Places table IDs"
    ActiveRecord::Base.connection.reset_pk_sequence!('places')
  end

  task import_cult_places: :environment do
    require 'csv'
    puts "Parsing CSV"

    csv = Dir["db/data/*"][0]

    CSV.foreach(csv, headers: true ) do |row|

      pl = Place.new
      pl.borough      = row[0]
      pl.kind         = row[1]
      pl.name         = row[2]
      pl.address      = row[3]
      pl.zip          = row [4]
      pl.city         = row[5]
      pl.province     = row[6]
      pl.phone        = row[7]
      pl.website      = row[8]
      pl.lng          = row[9]
      pl.lat          = row[10]
      pl.description  = row[11]
      pl.save
    end

    puts "Import library done"
  end

  task import_monuments: :environment do

    csv = Dir["db/data/*"][1]

    CSV.foreach(csv, headers: true ) do |row|

      pl = Place.new
      pl.kind          = 'Monument'
      pl.name          = row[1]
      pl.lng           = row [4]
      pl.lat           = row[5]
      pl.save
    end

    puts "Import monuments done"
  end
end

