Feature: Sign Up
  As a guest user
  To buy new, modern and fashion clothes at AMARO's shope
  I should be able to sign up on the e-commerce

  Background: Acess Home Page
    Given I am at AMARO homepage
    And click the sign up button
  
  Scenario: Successfull Sign Up
    When I sign up with "Valid Sign Up Credentials"
    Then I must see the success message "A conta foi criada com sucesso"

  
  Scenario Outline: Invalid Sign Up Attempt
    When I sign up with "<credentials_type>"
    Then I must see the failure message "<message>"

    Examples: 
      | credentials_type     | message                                                     |
      | invalid_mail         | Endereço de email inválido                                  | 
      | invalid_cpf          | CPF inválido                                                |
      | registered_cpf       | Já existe uma conta associada a este cpf                    |
      | invalid_date         | Data inválida                                               |
      | invalid_phone        | Telefone inválido                                           |