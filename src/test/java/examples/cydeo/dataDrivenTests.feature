Feature: Data Driven testing with Karate framework
  @dataDriven
  Scenario Outline: Get tokens for more than one user and print them
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    And def token = response.accessToken
    * print token

    Examples:
      | email                       | password           |
      | sbirdbj@fc2.com             | asenorval          |
      | htwinbrowb4@blogspot.com    | kanyabang          |
      | dfrederickb5@yellowbook.com | engraciahuc        |
      | apainb6@google.co.jp        | rosettalightollers |
      | fbawmeb7@studiopress.com    | sherilyngohn       |

    @dataDriven
  Scenario Outline: Get tokens for more than one user and print them
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    And def token = response.accessToken
    * print token

    Examples:
      |read('classpath:examples/data/users.csv') |