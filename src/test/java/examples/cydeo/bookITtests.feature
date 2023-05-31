Feature: By using token created at other feature file we will do API testing

Scenario: Get user info and verify the user
  * def AuthFeature = call read('classpath:examples/cydeo/bookITAuth.feature')
  * def accessToken = AuthFeature.token
  * print accessToken