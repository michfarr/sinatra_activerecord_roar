Feature: Artists CRUD Actions

  Scenario: Visiting the artists index
    Given there are 4 Artist
    When a user makes a GET request to "/artists"
    And the JSON from the server is valid
    Then Artist is indexed
    And the response code is 200

  Scenario: Visting a single artist
    Given there are 1 Artist
    When a user makes a GET request to "/artists/:name"
    And the JSON from the server is valid
    Then Artist is shown
    And the response code is 200

  Scenario: Create a new artist
    When a user makes a POST request to "/artists/:name"
    And the JSON from the client is valid
    Then Artist is added
    And the response code is 201

  Scenario: Update an existing artist
    Given there are 1 Artist
    When a user makes a PUT request to "/artists/:name"
    And the JSON from the client is valid
    Then Artist is updated
    And the response code is 201

  Scenario: Delete an existing artist
    Given there are 1 Artist
    When a user makes a DELETE request to "/artists/:name"
    And the JSON from the client is valid
    Then Artist is removed
    And the response code is 200
