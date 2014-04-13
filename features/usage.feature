Feature: ue can view an usage screen
  Scenario: Viewing help screen
    When I successfully run `gifr -h`
    Then the exit status should be 0
    And the stdout should contain "Usage:"

  Scenario: Invoking with correct parameters
    When I run `gifr ../../spec/fixtures/example1.mp4 -s 00:00:00 -t 7`
    Then the exit status should be 0

  Scenario: Invoking with no parameters at all
    When I run `gifr`
    Then the exit status should be 1
    And the stdout should contain "Usage:"
