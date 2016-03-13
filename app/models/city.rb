class City < ApplicationRecord
  has_many :tours
  has_many :places
  belongs_to :country

  validates_presence_of :name, :country_id
  validates :slug, presence: true,
            uniqueness: { case_sensitive: true }
  before_validation :slugify_name
  before_save :titleize_name

  def self.find_or_build_city(name)
    if city = City.find_by_slug(name.downcase)
      city
    else
      country = Country.find_or_create_by(name: 'Deutschland') # Default
      City.new(name: name, country_id: country ? country.id : 1)
    end
  end
end
