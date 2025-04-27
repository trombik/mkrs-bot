# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Logins", type: :feature do
  let(:user) { create(:user) }

  scenario "Sign-in" do
    visit "/"
    click_on "Sign in"
    fill_in "Password", with: user.password
    fill_in "Email", with: user.email
    click_on "Log in"
    expect(page).to have_content "Signed in successfully"
  end

  scenario "when the password is invalid, login fails" do
    visit "/"
    click_on "Sign in"
    fill_in "Password", with: "#{user.password}invalid"
    fill_in "Email", with: user.email
    click_on "Log in"
    expect(page).to have_no_content "Signed in successfully"
  end

  scenario "User can sign-out after sign-in" do
    visit "/"
    click_on "Sign in"
    fill_in "Password", with: user.password
    fill_in "Email", with: user.email
    click_on "Log in"
    click_on "Sign out"
    expect(page).to have_content "Signed out successfully"
  end
end
