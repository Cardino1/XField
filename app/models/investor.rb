# frozen_string_literal: true

class Investor < ApplicationRecord
  scope :approved, -> { where(approved: true) }
  scope :pending, -> { where(approved: false) }

  validates :firm_name, :values, :looking_for, :request_for_startups, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :website, allow_blank: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
