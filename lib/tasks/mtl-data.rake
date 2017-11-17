namespace :mtl_data do
  desc "Run all rake tasks"
  task run_all: [:environment, 'import_cult_places',
                               'import_monuments',
                               'import_walls']

  desc "Import mtl cultural places"

  task import_cult_places: :environment do
    require 'csv'

    puts "Destroying all Places"
    Place.destroy_all

    puts "Dumping & Reseting Places table IDs"
    ActiveRecord::Base.connection.reset_pk_sequence!('places')

    puts "Parsing public places"

    CSV.foreach("db/data/libraries.csv", headers: true ) do |row|

      pl = Place.new
      pl.borough      = row[0]
      case row[1]
      when 'Cinéma'
        pl.kind       = 'Cinéma,Théâtre'
      when 'Théâtre'
        pl.kind       = 'Cinéma,Théâtre'
      when 'Musée municipal'
        pl.kind       = 'Salle de spectacle,Musée municipal'
      else
        pl.kind       = row[1]
      end
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

    puts "API call: Monuments"

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

      Place.create(params[:place])

      puts "Saving #{monu['Titre']}"
    end

    puts "-------------------------"
    puts "Import monuments done"
    puts "-------------------------"
  end

  task import_walls: :environment do
    require 'net/http'
    require 'json'

    puts "API call: Walls"

    url = 'http://donnees.ville.montreal.qc.ca/dataset/53d2e586-6e7f-4eae-89a1-2cfa7fc29fa0/resource/d325352b-1c06-4c3a-bf5e-1e4c98e0636b/download/murales.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)

    puts "-------------------------"
    puts "Parsing Walls"
    puts "-------------------------"

    JSON.parse(response)['features'].each do |wall|
      params = {
        wall: {
          kind: "Wall",
          lng: wall["properties"]["longitude"],
          lat: wall["properties"]["latitude"],
          address: wall["properties"]["adresse"],
          type: wall["properties"]["type"],
          artist: wall["properties"]["artiste"],
          organisation: wall["properties"]["organisation"],
          program: wall["properties"]["program"],
          image: wall["properties"]["image"]
        }
      }

      Place.create(params[:wall])

      puts "Saving #{wall["properties"]["artiste"]}"
    end

    puts "-------------------------"
    puts "Import walls done"
    puts "-------------------------"
  end
end

