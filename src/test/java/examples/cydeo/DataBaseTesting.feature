Feature: Compare DB vs API

  Scenario: Connect DB and get info
    * def DBUtils = Java.type('examples.utilities.DBUtils')
    * def query = "select firstname, lastname, role from users where email = 'sbirdbj@fc2.com'"
    * def dbResult = DBUtils.getRowMap(query)
    * print dbResult