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

  class << self
    def sections_for_display
      opportunity_types.keys.map do |type|
        {
          type: type,
          label: human_readable_type(type),
          entries: approved.where(opportunity_type: type).order(created_at: :desc)
        }
      end
    end

    private

    def human_readable_type(type)
      human_enum_name(:opportunity_type, type)
    rescue I18n::MissingTranslationData
      type.to_s.humanize
    end
  end
end
