# frozen_string_literal: true

# A macro module for spec files
module ControllerMacros
  # https://github.com/heartcombo/devise/wiki/How-To:-Test-controllers-with-Rails-(and-RSpec)
  def login_admin
    before do
      sign_in FactoryBot.create(:admin, email: "admin_for_login@example.com")
    end
  end

  def login_user
    before do
      # override email to avoid duplicated address.
      # login_user is executed outside of examples. as such, sequence can
      # create duplicated email address, causing validation error in User
      # model.
      user = FactoryBot.create(:user, email: "user_for_login@example.com")
      sign_in user
    end
  end
end
