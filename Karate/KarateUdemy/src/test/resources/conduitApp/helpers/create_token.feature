Feature: Create Token

  Scenario: Create Token
    Given url 'https://api.realworld.io/api/'
    Given path 'users/login'
    And request { "user": { "email": "#(userEmail)", "password": "#(userPassword)" }}
    When method Post
    Then status 200
    * def authToken = response.user.token