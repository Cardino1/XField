source "https://rubygems.org"

ruby "3.4.4"

gem "rails", "~> 7.1.3"
gem "puma", "~> 5.6"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "sassc-rails"
gem "bootsnap", require: false

gem "sqlite3", "~> 1.7", group: [:development, :test]
gem "pg", "~> 1.5", group: :production

group :development, :test do
  gem "debug", platforms: %i[mri]
  gem "web-console"
  gem "listen"
end

group :test do
  gem "minitest"
end
