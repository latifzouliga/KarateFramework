Feature: Compare DB vs API
  Background:
    * def baseUrl = 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    * def AuthFeature = call read('classpath:examples/cydeo/bookITAuth.feature')
    * def accessToken = AuthFeature.token

  Scenario: Connect DB and get info
    * def DBUtils = Java.type('examples.utilities.DBUtils')
    * def query = "select firstname, lastname, role from users where email = 'sbirdbj@fc2.com'"
    * def dbResult = DBUtils.getRowMap(query)
    * print dbResult
    Given url baseUrl
    And path 'api/users/me'
    And header Authorization = 'Bearer',accessToken
    When method GET
    Then match response.firstName == dbResult.firstname