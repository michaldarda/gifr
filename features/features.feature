Feature: Invoking program with different parameters
  Scenario: Invoking with correct parameters
    When I run `gifr ../../spec/fixtures/example1.mp4 -s 00:00:00 -t 7`
    Then a file named "../../spec/fixtures/example1.mp4.gif" should exist
    And the exit status should be 0

  Scenario: Invoking with custom output file path
    When I run `gifr ../../spec/fixtures/example1.mp4 -s 00:00:00 -t 7 output.gif`
    Then a file named "output.gif" should exist
    And the exit status should be 0

  Scenario: Invoking with custom output file path and additional delay parameter
    When I run `gifr ../../spec/fixtures/example1.mp4 -s 00:00:00 -t 7 -d 20 output.gif`
    Then a file named "output.gif" should exist
    And the exit status should be 0

  Scenario: Invoking with not existing file 
    When I run `gifr ../../spec/fixtures/notexistingfile.mp4 -s 00:00:00 -t 7`
    Then the exit status should be 1
    And the stdout should contain "Given file does not exists"

  Scenario: Viewing help screen
    When I successfully run `gifr -h`
    Then the exit status should be 0
    And the stdout should contain "Usage:"

  Scenario: Invoking with no parameters at all
    When I run `gifr`
    Then the exit status should be 1
    And the stdout should contain "Usage:"
