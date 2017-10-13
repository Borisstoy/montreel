class PlaceDecorator < Draper::Decorator
  delegate_all

  def truncate_description
    if description.present?
      description.truncate(220, omission: '...')
    end
  end

  def full_description
    if description.present?
      description
    end
  end

  def name_cap
    if name.present?
      name.downcase.capitalize
    end
  end

  def location
    if borough.present? && monument_summary.park.present?
      h.content_tag(:span) do
        "#{borough + ', ' + monument_summary.park}"
      end
    elsif borough.present?
      h.content_tag(:span) do
        "#{borough}"
      end
    elsif monument_summary.park.present?
      h.content_tag(:span) do
        "#{monument_summary.park}"
      end
    elsif monument_summary.building.present?
      h.content_tag(:span) do
        "#{monument_summary.building}"
      end
    end
  end

  def artist_full_name
    if monument_summary.artist_name.present? && monument_summary.artist_last_name.present?
      h.content_tag(:span, class: 'artist-name') do
        monument_summary.artist_name + " " + monument_summary.artist_last_name
      end
    elsif monument_summary.artist_name.present?
      h.content_tag(:span, class: 'artist-name') do
        monument_summary.artist_name
      end
    else
      h.content_tag(:span, class: 'artist-name') do
        monument_summary.artist_last_name
      end
    end
  end

  def collection_name
    monument_summary&.collection_name_fr
  end

  def category
    monument_summary&.category_fr
  end

  def sub_cat_fra
    monument_summary&.sub_category_fr
  end

  def material_fr
    monument_summary&.materials_fr
  end

  def tech_fr
    if monument_summary.tech_fr.present?
      monument_summary&.tech_fr
                      .gsub(';', ' ~')
                      .downcase.truncate(85, omission: '...')
    end
  end

  def park
    monument_summary&.park
  end

  def building
    monument_summary&.building
  end

  def wall_artist
    wall_summary&.artist.truncate(30, omission: '...')
  end

  def wall_organisation
    wall_summary&.organisation
  end

  def wall_program
    wall_summary&.program
  end

  def wall_image
    wall_summary&.image
  end
end
