Feature: CLI

  Scenario: Running the dystio command
    When I run `dystio`
    Then the exit status should be 0
