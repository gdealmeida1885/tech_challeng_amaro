#en
Feature: Payment
  As a user that have choosen amazing clothes from AMARO's shop
  In order to receive my products at home
  I should be able to buy them 

  Background: Checkout
    Given I have choosen my items
    And I have clicked at "Ir Para O Pagamento" on the shopping cart

  Scenario: Valid Payment
    Given I have filled a " valid credit card data"
    When I click in "Revisar Seu Pedido"
    #since I had no way of acess RESUMO form, the next step is based on my experience using ecommerces
    Then my purchase should be approved

  Scenario: Invalid Payment 
    Given I have filled a "invalid credit card data"
    When I click in "Revisar Seu Pedido"
    Then I should see the message "Numero de cartão é invalido"

  Scenario: Valid Coupom
    Given I have filled a "valid credit card data"
    When I fill a "valid discount coupom"
    Then I should see the message "Cupom de desconto aplicado com sucesso!"
    And the discount amount should be subtracted from total

  Scenario: Invalid Coupom
    Given I have filled a "valid credit card data"
    When I fill a "valid discount coupom"
    Then I should see the message "Esse cupom não existe, expirou ou está inativo."