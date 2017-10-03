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
    puts "Parsing public places"

    CSV.foreach("db/data/libraries.csv", headers: true ) do |row|

      pl = Place.new
      pl.borough      = row[0]
      pl.kind         = row[1]
      pl.name         = row[2]
      pl.address      = row[3]
      pl.zip          = row[4]
      pl.city         = row[5]
      pl.province     = row[6]
      pl.phone        = row[7]
      pl.website      = row[8]
      pl.lng          = row[9]
      pl.lat          = row[10]
      pl.description  = row[11]
      pl.save
      puts "Saving #{row[2]}"
    end

    puts "-------------------------"
    puts "Import public places done"
    puts "-------------------------"
  end

  task import_monuments: :environment do
    require 'net/http'
    require 'json'

    puts "API call"

    url = 'http://donnees.ville.montreal.qc.ca/dataset/2980db3a-9eb4-4c0e-b7c6-a6584cb769c9/resource/18705524-c8a6-49a0-bca7-92f493e6d329/download/oeuvresdonneesouvertes.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)

    puts "-------------------------"
    puts "Parsing monuments"
    puts "-------------------------"

    JSON.parse(response).each do |monu|
      params = {
        place: {
          borough: monu["Arrondissement"],
          kind: "Monument",
          name: monu["Titre"],
          lng: monu["CoordonneeLongitude"],
          lat: monu["CoordonneeLatitude"],
          address: monu["AdresseCivique"],
          monument_summary_attributes: {
            collection_name_fr: monu["NomCollection"],
            collection_name_en: monu["NomCollectionAng"],
            category_fr: monu["CategorieObjet"],
            category_en: monu["CategorieObjetAng"],
            sub_category_fr: monu["SousCategorieObjet"],
            sub_category_en: monu["SousCategorieObjetAng"],
            materials_fr: monu["Materiaux"],
            materials_en: monu["MateriauxAng"],
            tech_fr: monu["Technique"],
            tech_en: monu["TechniqueAng"],
            park: monu["Parc"],
            building: monu["Batiment"],
            artist_name: monu["Artistes"][0]["Prenom"],
            artist_last_name: monu["Artistes"][0]["Nom"]
          }
        }
      }

      Place.create(params[:place])

      puts "Saving #{monu['Titre']}"
    end

    puts "-------------------------"
    puts "Import monuments done"
    puts "-------------------------"
  end
end

