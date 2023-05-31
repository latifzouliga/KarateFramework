@smoke
Feature: How to assert in Karate
  Background: Common steps for all scenarios in the feature file and also variables, definitions
    * def oneSpartan =
    """
    {
        "id": 1,
        "name": "Meade",
        "gender": "Male",
        "phone": 3584128232
    }
    """
    * def fourSpartans = read("classpath:examples/data/spartans.json")
  Scenario: simple match examples
    * match oneSpartan.name == 'Meade'
    * match fourSpartans[2].name == "Fidole"
    * def length = fourSpartans.length
    * match length == 4
    * def length = fourSpartans[2].name.length
    * match length == 6

  Scenario: fuzzy matching in Karate, dataTypes and existence of that variable
    * match oneSpartan.name == "#string"
    * match oneSpartan.id == "#number"
    * match oneSpartan.phone == "#present"
    * match oneSpartan.sword == "#notpresent"

  @wip
  Scenario: match each, kind of looping inside JSON Array objects
    * match each fourSpartans[*].id == "#number"
    * def expectedSpartan =
    """
    {
    "id": 2,
    "name": "Nels",
    "gender": "Male",
    "phone": 4218971348
  }
    """
    * match fourSpartans contains expectedSpartan
    * match fourSpartans contains any expectedSpartan
