@smoke
Feature: Simple API body header status checks

  Background: Get all books
    Given url 'https://demoqa.com/BookStore/v1/Books'
    When method get

  Scenario: GET all books and verify status and headers
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Content-Length == '#present'

  @wip
  Scenario: Verify Body information
   # * print response
   And def numberOfBooks = response.books.length
   Then match numberOfBooks == 8
   And match response.books[0].title == "Git Pocket Guide"
    # let's do loop inside books array
  And match each response.books[*].pages == "#number"

