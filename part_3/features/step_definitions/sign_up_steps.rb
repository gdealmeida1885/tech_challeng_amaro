Given("I am at AMARO homepage") do
  @home = HomePage.new
  @home.load
  @home.has_page_loaded?
end

Given("click the sign up button") do
  @home.click_login
  @login = LoginPage.new
  @login.register_new_user
end

When("I sign up with {string}") do |credentials|
  @signUp = SignUpPage.new
  @signUp.sign_up(credentials)
end

Then("I must see the success message {string}") do |sucess_message|
  @userAcc = UserAccountPage.new
  @userAcc.has_logged?
end

Then("I must see the failure message {string}") do |message|
  @signUp.has_failure_message?(message)
end