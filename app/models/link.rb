class Link < ApplicationRecord

  HOST = "mysite.ru"

  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug
  validates_length_of :url, within: 3..1023, on: :create, message: "too long"
  validates_length_of :slug, within: 3..1023, on: :create, message: "too long"

  def short
    Rails.application.routes.url_helpers.short_url(slug: self.slug, host: HOST)
  end
end
