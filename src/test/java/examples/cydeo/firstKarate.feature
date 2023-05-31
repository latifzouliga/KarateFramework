@smoke
Feature: Simple Karate scripts
  Scenario: How to print
    Given print "Hello World"
    * print 2+2
    # all same arithmetic operations of Java
    * def name = 'Mike'
    * def age = 30
    * print name,"is",age,"years old"
    # Mike is 30 years old
    # , concatenate variables and strings and inserts a space

  Scenario: JSON objects, first class citizens of Karate Framework
    * def student = {'name': 'Oscar', 'owe_tuition': false}
    * print student.name
    * def oneSpartan =
    """
    {
        "id": 1,
        "name": "Meade",
        "gender": "Male",
        "phone": 3584128232
    }
    """
    * print oneSpartan.gender
    * def fourSpartans = read("classpath:examples/data/spartans.json")
    * print fourSpartans
    * print fourSpartans[2].name
    # how to reach inside json arrays

