Feature: Sign Up new user

  Background: Preconditions
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()
    Given url apiUrl


  Scenario: New user Sign Up
    Given path 'users'
    And request
    """
     {
    "user": {
        "email": #(randomEmail),
        "password": "Marcos1205",
       "username": #(randomUsername)
    }
    }
    """
    When method Post
    And  match response ==
    """
    {
    "user": {
        "email": "#(randomEmail)",
        "username": "#(randomUsername)",
        "bio": "##string",
        "image": "#string",
        "token": "#String"
    }
    }
    """
    Then status 201

  Scenario: New user Sign Up
    Given def userData = {"email": "mar43@gmail.com","username": "Pruebasqa543"}
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()
    Given path 'users'
    And request {"user": {"email": #(userData.email),"password": "Marcos1205","username": #(userData.username)}}
    When method Post
    And  match response ==
"""
{
    "user": {
        "email": "#(randomEmail)",
        "username": "#(randomUsername)",
        "bio": "##string",
        "image": "#string",
        "token": "#String"
    }
}
"""
    Then status 201

  @t
  Scenario Outline: Validate Sign Yp error messages
    Given path 'users'
    And request
    """
     {
    "user": {
        "email": "<email>",
        "password": "<password>",
       "username": "<username>"
    }
    }
    """
    When method Post
    Then status 422
    And match response == <errorResponse>
    Examples:
      | email          | password  | username      | errorResponse                                     |
      | #(randomEmail) | Karate123 | KarateUser123 | {"errors": {"email": ["has already been taken"]}} |
