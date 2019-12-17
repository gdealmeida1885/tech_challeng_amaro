class LoginPage < SitePrism::Page
  include RSpec::Matchers
  set_url 'https://amaro.com/identify'

  element :field_userId, "input[name='emailOrCpf']"
  element :field_userPass, "input[name='password']"
  element :btn_login, '.app__form__actions'
  element :alert_message, '.app__alert__content'
  element :link_register, "a[href='#register']"

  def has_page_loaded?
    has_field_userId?
  end

  def fill_login(credentials)
    field_userId.send_keys DATA[credentials]['email']
    btn_login.click
    if credentials != 'invalid_email'
      field_userPass.send_keys DATA[credentials]['password']
      btn_login.click
    end
  end

  def has_alert?(message)
    expect(alert_message.text).to eq(message)
  end

  def register_new_user 
    link_register.click
  end
end