# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :summary, :content, :published_on, presence: true
  validates :hero_image_url, allow_blank: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
