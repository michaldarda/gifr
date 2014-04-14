Feature: User can invoke program with diffrent parameters
  Scenario: Invoking with correct parameters
    When I run `gifr ../../spec/fixtures/example1.mp4 -s 00:00:00 -t 7`
    Then a file named "../../spec/fixtures/example1.mp4.gif" should exist
    And the exit status should be 0

  Scenario: Invoking with custom output file path
    When I run `gifr ../../spec/fixtures/example1.mp4 -s 00:00:00 -t 7 output.gif`
    Then a file named "output.gif" should exist
    And the exit status should be 0

  Scenario: Invoking with additional delay parameter
    When I run `gifr ../../spec/fixtures/example1.mp4 -s 00:00:00 -t 7 -d 20 output.gif`
    Then a file named "output.gif" should exist
    And the exit status should be 0
