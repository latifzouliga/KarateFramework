Feature: By using token created at other feature file we will do API testing

  Background:
    * def baseUrl = 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    * def AuthFeature = call read('classpath:examples/cydeo/bookITAuth.feature')
    * def accessToken = AuthFeature.token
    * def expectedUser =
    """
    {
    "id": 140,
    "firstName": "Ase",
    "lastName": "Norval",
    "role": "student-team-leader"
}
    """

Scenario: Get user info and verify the user
    Given url baseUrl
    And path 'api/users/me'
    And header Authorization = 'Bearer',accessToken
    When method GET
    Then match response == expectedUser

Scenario: Get campuses of the bookIT api and verify it by using a data json file
  Given url baseUrl
  And path 'api/campuses'
  And header Authorization = 'Bearer',accessToken
  When method GET
  And def expectedCampuses = read('classpath:examples/data/campuses.json')
  Then match response == expectedCampuses