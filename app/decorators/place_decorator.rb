class PlaceDecorator < Draper::Decorator
  delegate_all

  def truncate_description
    if description.present?
      description.truncate(250, omission: '...')
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

  def artist_name
    if monument_summary.artist_name.present?
      monument_summary.artist_name
    end
  end
end
