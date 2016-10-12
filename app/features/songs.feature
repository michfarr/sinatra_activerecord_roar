Feature: Song CRUD Actions

  Scenario: List all songs
    Given there are 4 Songs
    When a user views all Songs
    And the response status is 200

  Scenario: View a song
    Given there are 2 Songs
    When a user views a single Song
    And the response status is 200

  Scenario: Create a song
    Given there are 2 Songs
    When a user attempts to add a Song
    Then 1 Song is created
    And the response status is 201

  Scenario: Update a song
    Given there are 2 Songs
    When a user attempts to update the first Song
    Then the first Song is updated
    And the response status is 200

  Scenario: Delete a song
    Given there are 2 Songs
    When a user attempts to delete the first Song
    Then 1 Song is removed
    And the response status is 200
    And there is now 1 Song
