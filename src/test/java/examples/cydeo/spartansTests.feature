Feature: Testing different end points of spartan API
  Background:
    * def spartanUrl = "http://54.85.44.234:8000"

Scenario: Get one spartan and verify
  * def expectedSpartan = read("classpath:examples/data/expectedSpartan.json")
  Given url spartanUrl
  And path "api/spartans"
  And path 101
  And header Accept = 'application/json'
  When method get
  Then match response == expectedSpartan

  Scenario: Query parameters in Karate
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'j'
    And param gender = 'Female'
    When method get
    Then status 200
    And match each response.content[*].gender == 'Female'

  Scenario: POST a spartan by using spartan generator JAVA class file then DELETE
    * def SpartanDG = Java.type("examples.utilities.SpartanDataGenerator")
    * def newSpartan = SpartanDG.createSpartan()
    # returns MAP object, Karate automatically turns it into JSON object
    Given url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newSpartan
    When method POST
    Then status 201
    And match response.success == 'A Spartan is Born!'
    And match response.data.name == newSpartan.name
    Then def idForDelete = response.data.id
    # let's do GET request to verify
    Given url spartanUrl
    And path "api/spartans"
    And path idForDelete
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.name == newSpartan.name
    # we will capture id from POST request and use that id for Delete Request
    Given url spartanUrl
    And path "api/spartans"
    And path idForDelete
    When method DELETE
    Then status 204


