Feature: Tests for the home page

  Background: Define URL
    Given url apiUrl

  Scenario: Get all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['welcome','implementations']
    And match response.tags !contains 'truck'
    #Si alguno lo encuentra entre ese array
    And match response.tags contains any ['PruebaSQA','et','prueba']
    And match each response.tags == '#string'

  Scenario: Get 10 articles from the page
    * def timeValidator = read ('classpath:conduitApp/helpers/timeValidator.js')
    Given params {limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
   #And match response.articles == '#[10]'
    #And match response.articlesCount == 207
    #And match response.articlesCount != 200
    And match response == {"articles": "#[10]", "articlesCount": 207}
    #And match response.articles[0].createdAt contains '2023'
    #And match response.articles[*].favoritesCount contains 0
    #And match response..bio contains null
    #And match each response..following == false
    #And match each response..following == '#boolean'
    #And match each response..favoritesCount == '#number'
    #And match each response..bio == '##string'
    And match each response.articles ==
  """
    {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": "#array",
            "createdAt": '#? timeValidator(_)',
            "updatedAt": '#? timeValidator(_)',
            "favorited": '#boolean',
            "favoritesCount": '#number',
            "author": {
                "username": "#string",
                "bio": "##string",
                "image": "#string",
                "following": '#boolean'
            }
        }
  """


 # Scenario: Get 10 articles from the page
  #  Given param limit = 10
   # Given param offset = 0
    #When method Get
    #Then status 200