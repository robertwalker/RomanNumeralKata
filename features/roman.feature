Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Present an error message given any other values
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  Scenario: Throw error when given 0
    Given I have the arabic number 0
    When I convert to Roman
    Then I should see an error message explaining that 0 is outside the range 1-3999

  Scenario: Throw error when given a negative number
    Given I have the arabic number -1
    When I convert to Roman
    Then I should see an error message explaining that any negative number is outside the range 1-3999

  Scenario: Throw error when given a number greater than 3999
    Given I have the arabic number 4000
    When I convert to Roman
    Then I should see an error message explaining that numbers above 3999 are outside the range 1-3999

  Scenario: Convert 1 to "I"
    Given I have the arabic number 1
    When I convert to Roman
    Then I should see the string "I"

  Scenario: Convert 2 to "II"
    Given I have the arabic number 1
    When I convert to Roman
    Then I should see the string "II"

  Scenario: Convert 3 to "III"
    Given I have the arabic number 3
    When I convert to Roman
    Then I should see the string "III"

  Scenario: Convert 4 to "IV"
    Given I have the arabic number 4
    When I convert to Roman
    Then I should see the string "IV"

  Scenario: Convert 5 to "V"
    Given I have the arabic number 5
    When I convert to Roman
    Then I should see the string "V"

  Scenario: Convert 6 to "VI"
    Given I have the arabic number 6
    When I convert to Roman
    Then I should see the string "VI"

  Scenario: Convert 8 to "VIII"
    Given I have the arabic number 8
    When I convert to Roman
    Then I should see the string "VIII"

  Scenario: Convert 9 to "IX"
    Given I have the arabic number 9
    When I convert to Roman
    Then I should see the string "IX"

  Scenario: Convert 10 to "X"
    Given I have the arabic number 10
    When I convert to Roman
    Then I should see the string "X"

  Scenario: Convert 20 to "XX"
    Given I have the arabic number 20
    When I convert to Roman
    Then I should see the string "XX"

  Scenario: Convert 30 to "XXX"
    Given I have the arabic number 30
    When I convert to Roman
    Then I should see the string "XXX"
