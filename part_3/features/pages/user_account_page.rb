class UserAccountPage < SitePrism::Page
  include RSpec::Matchers
  set_url 'https://amaro.com/account'
  
  element :greetings, '.app__account__dashboard > h1'
  element :alert_success, '.app__alert .is_success'

  def has_logged?
    expect(greetings.text).to eq('Olá, Gabriel!')
  end

  def has_sucess_message?(message)
    expect(alert_success).to eq(message)
  end
end