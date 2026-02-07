# frozen_string_literal: true

require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"

  gem "rails", path: "."
  # If you want to test against edge Rails replace the previous line with this:
  # gem "rails", github: "rails/rails", branch: "main"

  gem "sqlite3"
  gem "benchmark-ips"
  gem "vernier"
end

require "active_record/railtie"
require "benchmark/ips"

# This connection will do for database-independent bug reports.
ENV["DATABASE_URL"] = "sqlite3::memory:"

class TestApp < Rails::Application
  config.load_defaults Rails::VERSION::STRING.to_f
  config.eager_load = false
  config.logger = Logger.new(nil)
  config.secret_key_base = "secret_key_base"

  config.active_record.encryption.primary_key = "primary_key"
  config.active_record.encryption.deterministic_key = "deterministic_key"
  config.active_record.encryption.key_derivation_salt = "key_derivation_salt"
end
Rails.application.initialize!


ActiveRecord::Schema.define do
  create_table :posts, force: true do |t|
  end

  create_table :comments, force: true do |t|
    t.integer :post_id
  end
end

class Post < ActiveRecord::Base
end

# Vernier.profile(out: "time_profile.json") do
#   (55060 * 10).times do
#     Post.count
#   end
# end

BRANCH = `git rev-parse --abbrev-ref HEAD`.strip

Benchmark.ips do |x|
  x.report(BRANCH) { Post.count }
  x.save!("/tmp/bench-ar-data")
  x.compare!(order: :baseline)
end
