Feature: We can view an usage screen

  Scenario: Viewing help screen
    When I successfully run `gifr -h`
    Then the exit status should be 0
    And the stdout should contain "Usage:"

  Scenario: Invoking with correct parameters
    When I run `gifr video.mp4 -f 1h0m1s -t 1h0m3s`
    Then the exit status should be 0

  Scenario: Invoking with no parameters at all
    When I run `gifr`
    Then the exit status should be 1
    And the stdout should contain "Usage:"

  Scenario: Invoking with incorrect parameters
    When I run `gifr filename -f notime -t 1h10m30s`
    Then the exit status should be 1
    And the stdout should contain "Usage:"
