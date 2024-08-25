Feature: create new user - method post

  Background:
    * url urlBaseLogin
    * def requestBody = read ('classpath:json/new_user.json')
    * def pathPost = api.pathPost
    * def dataGenerator = Java.type ('helpers.DataGenerator')

  @usuarioCreadoExistosamente
  Scenario: create new user - method post
    Given path pathPost
    * def email = dataGenerator.getRandomEmail()
    * def username = dataGenerator.getUserName()
    * def password = dataGenerator.getRandomPassword()
    * set requestBody.user.email = email
    * set requestBody.user.username = username
    * set requestBody.user.password = password
    When request requestBody
    And method Post
    Then status 201

# 1 validar que se haya creado el usuario que ustedes colacaron
  #2 caso no exitoso, match
  #3 caso aleatorio