Feature: Articles

  Background: Define Url
    * url apiUrl
    * def articleRequestBody = read ('classpath:conduitApp/json/new_article_request.json')
    * def dataGenerator = Java.type ('conduitApp.helpers.DataGenerator')
    * def generatedArticleValues = dataGenerator.getRandomArticleValues()
    * set articleRequestBody.article.title = generatedArticleValues.title
    * set articleRequestBody.article.description = generatedArticleValues.description
    * set articleRequestBody.article.body = generatedArticleValues.body
    #* def tokenResponse = callonce read('classpath:helpers/create_token.feature') { "user": { "email": "mar@gmail.com", "password": "Marcos1205" }}
    #* def tokenResponse = callonce read('classpath:helpers/create_token.feature')
    #* def token = tokenResponse.authToken

  @t
  Scenario: Create a new article
    #Given  header Authorization = 'Token '+ token
    Given path 'articles'
    And request articleRequestBody
    When method Post
    Then status 201
    And match response.article.title == articleRequestBody.article.title


  Scenario: Create and delete article
    #Given  header Authorization = 'Token '+ token
    Given path 'articles'
    And request articleRequestBody
    When method Post
    Then status 201
    * def articleId = response.article.slug

    Given params {limit: 10, offset:0}
    Given path 'articles'
    When method Get
    Then status 200
  #  And  match response.articles[0].title == articleRequestBody.article.title

   # Given  header Authorization = 'Token '+ token
    Given path 'articles',articleId
    When method Delete
    Then status 204
   # And match response.articles[0].title != articleRequestBody.article.title