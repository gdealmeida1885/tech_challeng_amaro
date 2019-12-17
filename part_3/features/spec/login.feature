#en
Feature: Login
  As a registered user
  In order to purchase itens at AMARO's shop
  I must be able to login

  Background: Acces HomePage
    Given I am at AMARO's HomePage

  Scenario: Login Sucessfully
    When I login with "valid_credentials"
    Then I should be logged at AMARO's webpage

  Scenario: Invalid Email
    When I login with 'invalid_email'
    Then I should see the message "E-mail ou CPF não está cadastrado. Gostaria de criar uma conta?"

  Scenario: Invalid Password
    When I login with 'invalid_password'
    Then I should see the message 'Senha incorreta. Tente novamente.'