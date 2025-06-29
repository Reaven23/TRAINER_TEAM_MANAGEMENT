module UserSkillsHelper
  def status_label(status)
    case status
    when 'Acquis'
      'Acquise'
    when 'En_Progrès'
      'En cours'
    when 'Non_Acquis'
      'Non acquise'
    else
      status
    end
  end

  def status_badge_class(status)
    case status
    when 'Acquis'
      'bg-success'
    when 'En_Progrès'
      'bg-warning'
    when 'Non_Acquis'
      'bg-danger'
    else
      'bg-secondary'
    end
  end
end
