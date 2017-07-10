module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Authentication From Scratch in Ruby on Rails").join(" - ")
      end
    end
  end
end
