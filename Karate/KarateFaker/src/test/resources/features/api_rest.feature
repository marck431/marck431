Feature: Plan de prueba - get

  Background:
    * url urlBase
    * def pathGet = api.pathGet
    * def pathPost = api.pathPost
    * def requestBody = read ('classpath:json/sign_up.json')


  @consumoGet
  Scenario: Caso de prueba tipo REST - GET
    Given path pathGet
    When method GET
    Then status 200

  @consumoPost
  Scenario: Caso de prueba tipo REST - POST
    Given path pathPost
    When request requestBody
    And method POST
    And match response.name == '#string'
    And match response.name == 'morpheus'
    Then status 201
