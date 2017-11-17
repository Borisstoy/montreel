class PlaceDecorator < Draper::Decorator
  delegate_all

  def truncate_description
    if description.present?
      description.truncate(190, omission: '...')
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
    if borough.present? && park.present?
      h.content_tag(:span) do
        "#{borough + ', ' + park}"
      end
    elsif borough.present?
      h.content_tag(:span) do
        "#{borough}"
      end
    elsif park.present?
      h.content_tag(:span) do
        "#{park}"
      end
    elsif building.present?
      h.content_tag(:span) do
        "#{building}"
      end
    end
  end

  def artist_full_name
    if artist_name.present? && artist_last_name.present?
      h.content_tag(:span, class: 'artist-name') do
        artist_name + " " + artist_last_name
      end
    elsif artist_name.present?
      h.content_tag(:span, class: 'artist-name') do
        artist_name
      end
    else
      h.content_tag(:span, class: 'artist-name') do
        artist_last_name
      end
    end
  end

  def techo_fr
    if tech_fr.present?
      tech_fr.gsub(';', ' ~')
             .downcase.truncate(85, omission: '...')
    end
  end

  def wall_artist
    artist.truncate(30, omission: '...')
  end
end
