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
end
