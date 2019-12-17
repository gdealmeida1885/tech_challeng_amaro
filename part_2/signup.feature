#en
Feature: Register New User
  I as a visitor of AMARO Store
  In order to buy amazing clothes
  I must be able to register myself

  Background: Login in AMARO's page 

  Scenario: Successfull Register
    Given I am at AMARO new user page
    When I try register myself with valid credentials
    Then I must see the message "A conta foi criada com sucesso"

  Scenario Outline: Invalid Credentials
    Given I am at AMARO home page
    When I try to register myself with:
      | name        | <name>         |
      | lastname    | <lastname      |
      | birthDate   | <birthDate     |
      | phoneNumber | <phoneNumber>  |
      | email       | <email>        |
      | cpf         | <cpf>          |
      | password    | <password>     |
    Then I have to see the message "<message>"

    Examples:
      | name        |  lastname |birthDate   | phoneNumber | email                          | cpf            | password       | message                    |
      | Gabriel     |  Almeida  | 22/05/1995 | 11954419893 | teste1234@teste                | 351.785.850-11 | 123456         | Endereço de email inválido | 
      | Mayara      | Correa    | 07/05/1993 | 11964495543 | paiva.mayara@gmail.com         | 351.785.850-12 | 5431           | CPF invalido               |