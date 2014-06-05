Feature: CLI version command

  Scenario: Displaying the Dystio version
    When I run `dystio --version`
    Then the output should contain the current version
    And the exit status should be 0
