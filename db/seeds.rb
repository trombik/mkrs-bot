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

case Rails.env
when "development"
  User.find_or_create_by email: "y@trombik.org" do |user|
    user.password = "password"
    user.password_confirmation = "password"
  end
  user = User.find_by(email: "y@trombik.org")

  StaffGroup.find_or_create_by name: "Example group"
  if Task.count < 10
    (10 - Task.count).times do
      Task.create!(
        name: "Clean #{Faker::House.room}",
        description: Faker::Lorem.paragraph(sentence_count: 20),
        user: user
      )
    end
  end
end
