#en
Feature: Shopping Cart
  I as a registered user of AMARO 
  To buy new clothes in the shopping
  I must be able to add and remove itens in the shopping cart

  Background: Login in AMARO's page
    Given I am logged in AMARO website
    
  Scenario: Add Itens To Shopping Cart
    When I add a item to the shopping cart
    Then the shop cart should be updated with the new item

  Scenario: Remove Itens From Shopping Cart
    Given I have already added itens to the shopping cart
    When I remove an item
    Then the shop cart should remove the item
  
  Scenario: Add Zip Code to Shopping Cart
    Given I have already added itens to the shopping cart
    When I add my ZipCode
    Then the shopping cart should add the shipping tax to the total amount

  Scenario: Empty The Shopping Cart
    Given I have already added itens to the shopping cart
    When I clean the shopping cart
    Then I must see the message: "Sua sacola está vazia!"

