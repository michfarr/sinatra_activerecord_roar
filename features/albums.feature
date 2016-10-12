Feature: Album CRUD Actions

  Scenario: List all albums
    Given there are 4 Albums
    When a user views all Albums
    And the response status is 200

  Scenario: View an album
    Given there are 2 Albums
    When a user views a single Album
    And the response status is 200

  Scenario: Create an album
    Given there are 2 Albums
    When a user attempts to add an Album
    Then 1 Album is created
    And the response status is 201

  Scenario: Update an album
    Given there are 2 Albums
    When a user attempts to update the first Album
    Then the first Album is updated
    And the response status is 200

  Scenario: Delete an album
    Given there are 2 Albums
    When a user attempts to delete the first Album
    Then 1 Album is removed
    And the response status is 200
    And there is now 1 Album
