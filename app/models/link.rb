class Link < ApplicationRecord
  MIN_LENGTH = 10
  MAX_LENGTH = 1023

  validates_length_of :url, { 
    in: MIN_LENGTH..MAX_LENGTH, 
    message: I18n.t("models.link.custom_error.url_too_short_or_long") 
  }
  
  validates :url, format: { 
    with: URI::DEFAULT_PARSER.regexp[:ABS_URI], 
    message: I18n.t("models.link.custom_error.invalid_format_url") 
  }

  after_validation :find_or_craete_slug

  def short
    Rails.application.routes.url_helpers.short_url(slug: self.slug, host: HOST)
  end

  private
  def find_or_craete_slug
    self.slug = set_uuid if self.class.find_by(url: url).nil?
  end

  def set_uuid
    loop do 
      uuid = SecureRandom.alphanumeric(6)
      return uuid unless Link.exists?(slug: uuid)
    end
  end
end
