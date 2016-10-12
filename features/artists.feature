Feature: Artists CRUD Actions

  Scenario: List all artists
    Given there are 4 Artists
    When a user views all Artists
    And the response status is 200

  Scenario: View an artist
    Given there are 2 Artists
    When a user views a single Artist
    And the response status is 200

  Scenario: Create an artist
    Given there are 2 Artists
    When a user attempts to add an Artist
    Then 1 Artist is created
    And the response status is 201

  Scenario: Update an artist
    Given there are 2 Artists
    When a user attempts to update the first Artist
    Then the first Artist is updated
    And the response status is 200

  Scenario: Delete an artist
    Given there are 2 Artists
    When a user attempts to delete the first Artist
    Then 1 Artist is removed
    And the response status is 200
    And there is now 1 Artist
