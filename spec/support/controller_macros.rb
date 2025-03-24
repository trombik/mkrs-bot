module ControllerMacros
  # https://github.com/heartcombo/devise/wiki/How-To:-Test-controllers-with-Rails-(and-RSpec)
  def login_admin
    before do
      sign_in FactoryBot.create(:admin)
    end
  end

  def login_user
    before do
      sign_in FactoryBot.create(:user)
    end
  end
end
