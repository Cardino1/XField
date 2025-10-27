# frozen_string_literal: true

class Opportunity < ApplicationRecord
  enum :opportunity_type, {
    jobs: "jobs",
    research: "research",
    open_source: "open_source",
    co_founder: "co_founder"
  }, validate: true

  scope :approved, -> { where(approved: true) }
  scope :pending, -> { where(approved: false) }

  validates :opportunity_type, :title, :full_name, :organization, :description, presence: true
  validates :link, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
