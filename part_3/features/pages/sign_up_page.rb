class SignUpPage < SitePrism::Page
  include RSpec::Matchers

  set_url 'https://amaro.com/register'

  element :field_name, "input[name='name']"
  element :field_last_name, "input[name='lastname']"
  #Form some strange and bizarre reason, capybara is finding two elements with inupt type email
  #Because of it, the solution bellow doens't work. Had to manually finding it. 
  #element :field_mail, "div.form-group > div > input[name='email']"
  element :field_cpf, "input[name='cpf']"
  element :field_birthday, "input[name='birthdate']"
  element :field_phone, "input[name='phone']"
  element :field_password, "input[name='password']"
  element :field_pass_confirm, "input[name='passwordConfirmation']"
  element :link_login, "a[href=#identify]"
  element :form_sign_up, ".app__form .app__form--floating"
  element :btn_submit, "div.app__form__actions > button[type='submit']"

  def has_page_loaded?
    has_link_login?
  end

  def sign_up(credentials)
    credentials = transform_data(credentials)
    field_name.send_keys SIGN_DATA[credentials]['name']
    field_last_name.send_keys SIGN_DATA[credentials]['lastname']
    first("input[type=email][name=email]").send_keys SIGN_DATA[credentials]['email'] 
    field_cpf.send_keys SIGN_DATA[credentials]['cpf']
    field_birthday.send_keys SIGN_DATA[credentials]['birth']
    field_phone.send_keys SIGN_DATA[credentials]['phone']
    field_password.send_keys SIGN_DATA[credentials]['password']
    field_pass_confirm.send_keys SIGN_DATA[credentials]['passwordConfirmation']
    btn_submit.click if !btn_submit.disabled?
  end

  def has_failure_message?(message)
    expect(page).to have_content(message)
  end

  def transform_data(credentials)
    return credentials = credentials.downcase.gsub(' ', '_')
  end
end