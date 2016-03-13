class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def slugify_name
    self.slug = self.name.to_s.parameterize if attribute_present?('name')
  end

  def titleize_name
    self.name = self.name.to_s.titleize if attribute_present?('name')
  end
end
