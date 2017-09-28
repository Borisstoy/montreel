module PlaceHelper
  def place_contact(place)
    if place.website.present?
      label = Place.human_attribute_name(:website)
      website = place.website.split(',')[0]
      phone   = place.phone
      content_tag(:div) do
        concat (link_to label, website, target: '_blank') + ' - ' + phone
      end
    end
  end

  def places_description(description)
    if description.present?
      description
    else
      t('no_description')
    end
  end

  def kinds_collection
    {
      "Centre communautaire": "Centres communautaires",
      "Monument": "Monuments",
      "Cinéma,Théâtre": "Cinémas, Théâtres",
      "Théâtre": "Théâtres",
      "Centre des loisirs": "Centres des loisirs",
      "Cinéma": "Cinémas",
      "Bibliothèque,Centre communautaire,Salle de spectacle": "Bibliothèques, Centres communautaires, Salles de spectacles",
      "Salle de spectacle,Musée municipal": "Salles de spectacles, Musées municipaux",
      "Musée municipal": "Musées municipaux",
      "Bibliothèque": "Bibliothèques",
      "Salle de spectacle": "Salles de spectacles",
      "Église": "Églises",
    }
  end

  def places_results_header(kind)
    kinds_collection.select do |csv_kind, real_kind|
      csv_kind = csv_kind.to_s
      if kind.start_with?(csv_kind) && kind.end_with?(csv_kind)
        return real_kind
      end
    end
  end

  def kind_header_color(kind)
    kind = places_results_header(kind)
    case kind
    when "Centres communautaires"
      "com_centers"
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
