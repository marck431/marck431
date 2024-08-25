Feature: Descripción de alto nivel del comportamiento de la operación en el software y agrupar escenarios relacionados.

  Background:
    * url api.urlBase
    * def operationBody = callonce read ('classpath:karate/loginapi/data/login_body.json')
    * def operationHeader = callonce read ('classpath:karate/loginapi/data/login_header.json')
    * def errors = callonce read ('classpath:karate/common/generic_errors.json')
    * def dataGenerator = Java.type ('karate.helpers.DataGenerator')


  @loginExitoso
  Scenario Outline: El usuario se pudo logear exitosamente
    * set operationBody.email = '<email>'
    * set operationBody.password = '<password>'
    Given path path.loginPetition
    And headers operationHeader
    And request operationBody
    When method post
    Then status 200
    And match response.token == '#string'
    Examples:
      | email              | password   |
      | eve.holt@reqres.in | cityslicka |

  @LoginFallido
  Scenario Outline: El usuario no se podrá logear
    * set operationBody.email = '<email>'
    * set operationBody.password = '<password>'
    Given path path.loginPetition
    And headers operationHeader
    And request operationBody
    When method post
    Then status 400
    And match response.error == errors.error01
    Examples:
      | email              | password |
      | eve.holt@reqres.in |          |


  @LoginNoExiste
  Scenario Outline: El usuario no existe
    * def emailRandom = dataGenerator.getRandomEmail()
    * def passwordRandom = dataGenerator.getRandomPassword()
    * set operationBody.email = <email>
    * set operationBody.password = <password>
    Given path path.loginPetition
    And headers operationHeader
    And request operationBody
    When method post
    Then status 400
    And match response.error == errors.error02
    Examples:
      | email       | password       |
      | emailRandom | passwordRandom |
