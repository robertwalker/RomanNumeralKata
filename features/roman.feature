Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

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

  Scenario: Convert 10 to "X"
    Given I have the arabic number 10
    When I convert to Roman
    Then I should see the string "X"
