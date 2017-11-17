module PlaceHelper
  def place_contact(place)
    if place.website.present?
      label = Place.human_attribute_name(:website)
      website = place.website.split(',')[0]
      phone   = place.phone
      content_tag(:div) do
        concat (link_to label, website, target: '_blank') + ' - ' + phone + "<br>".html_safe + "<hr>".html_safe
      end
    end
  end

  def is_monument?(place)
    place.kind == 'Monument'
  end

  def is_wall?(place)
    place.kind == 'Wall'
  end

  def kinds_collection
    {
      "Monument": "Monuments",
      "Wall": "Fresques murales",
      "Centre communautaire": "Centres communautaires",
      "Cinéma,Théâtre": "Cinémas, Théâtres",
      "Centre des loisirs": "Centres des loisirs",
      "Bibliothèque,Centre communautaire,Salle de spectacle": "Bibliothèques, Centres communautaires, Salles de spectacles",
      "Salle de spectacle,Musée municipal": "Salles de spectacles, Musées municipaux",
      "Bibliothèque": "Bibliothèques",
      "Salle de spectacle": "Salles de spectacles",
      "Église": "Églises"
    }
  end

  def places_results_header(kind)
    kinds_collection.select do |csv_kind, real_kind|
      csv_kind = csv_kind.to_s
      unless csv_kind.nil?
        if kind.start_with?(csv_kind) && kind.end_with?(csv_kind)
          return real_kind
        end
      end
    end
  end

  def kind_header_color(kind)
    kind = places_results_header(kind)
    case kind
    when "Centres communautaires"
      "com_centers"
    when "Fresques murales"
      "wall"
    when "Monuments"
      "monuments"
    when "Cinémas, Théâtres"
      "cin_the"
    when "Théâtres"
      "the"
    when "Centres des loisirs"
      "hobby_cent"
    when "Cinémas"
      "cin"
    when "Bibliothèques, Centres communautaires, Salles de spectacles"
      "lib_com_spe"
    when "Salles de spectacles, Musées municipaux"
      "spe_mus"
    when "Musées municipaux"
      "mus"
    when "Bibliothèques"
      "lib"
    when "Salles de spectacles"
      "spe"
    when "Églises"
      "church"
    end
  end
end
