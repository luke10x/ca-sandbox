Feature: Can access google search
  Everybody wants to get relevant results from search

  Scenario: Finding some cheese
    Given I am on the Google search page
    When I search for "Cheese!"
    Then the page title should start with "cheese"