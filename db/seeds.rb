# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

StaffGroup.find_or_create_by name: "All staffs"

case Rails.env
when "development"
  User.find_or_create_by email: "y@trombik.org" do |user|
    user.password = "password"
    user.password_confirmation = "password"
  end

  StaffGroup.find_or_create_by name: "Example group"
end
