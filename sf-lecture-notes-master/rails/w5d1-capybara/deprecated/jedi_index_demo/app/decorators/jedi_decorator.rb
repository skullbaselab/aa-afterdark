class JediDecorator < Draper::Decorator
  delegate_all

  def formatted_created_at
    object.created_at.strftime('%b %-d, %Y')
  end

  def powers
    object.powers.map(&:capitalize).to_sentence
  end

  def link
    h.link_to(h.sanitize(object.name), object).html_safe
  end
end
