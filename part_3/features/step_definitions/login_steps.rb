Given("I am at AMARO's HomePage") do
  @home = HomePage.new
  @home.load
  @home.has_page_loaded?
end

When("I login with {string}") do |credentials|
  @home.click_login
  @login = LoginPage.new
  @login.fill_login(credentials)
end

Then("I should be logged at AMARO's webpage") do
  @userAcc = UserAccountPage.new
  @userAcc.has_logged?
end

Then("I should see the message {string}") do |message|
  @login.has_alert?(message)
end