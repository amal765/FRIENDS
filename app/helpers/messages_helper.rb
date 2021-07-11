# frozen_string_literal: true

module MessagesHelper
  def extract_text(html)
    ActionView::Base.full_sanitizer.sanitize(html)
  end
end
