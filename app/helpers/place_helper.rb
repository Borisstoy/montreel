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
      "Centre communautaire": "Centre communautaire",
       "Monument": "Monument",
       "Cinéma, Théâtre": "Cinéma,Théâtre",
       "Théâtre": "Théâtre",
       "Centre des loisirs": "Centre des loisirs",
       "Cinéma": "Cinéma",
       "Bibliothèque, Centre communautaire, Salle de spectacle": "Bibliothèque,Centre communautaire,Salle de spectacle",
       "Salle de spectacle, Musée municipal": "Salle de spectacle,Musée municipal",
       "Musée municipal": "Musée municipal",
       "Bibliothèque": "Bibliothèque",
       "Salle de spectacle": "Salle de spectacle",
       "Église": "Église",
    }
  end
end
