Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  # Success Scenarios

  Scenario: Convert 1 to "I"
    Given I have the arabic number 1
    When I convert to Roman
    Then I should see the string "I"

  Scenario: Convert 3 to "III"
    Given I have the arabic number 3
    When I convert to Roman
    Then I should see the string "III"

  Scenario: Convert 4 to "IV"
    Given I have the arabic number 4
    When I convert to Roman
    Then I should see the string "IV"

  Scenario: Convert 9 to "IX"
    Given I have the arabic number 9
    When I convert to Roman
    Then I should see the string "IX"

  Scenario: Convert 10 to "X"
    Given I have the arabic number 10
    When I convert to Roman
    Then I should see the string "X"

  Scenario: Convert 40 to "XL"
    Given I have the arabic number 40
    When I convert to Roman
    Then I should see the string "XL"

  Scenario: Convert 50 to "L"
    Given I have the arabic number 50
    When I convert to Roman
    Then I should see the string "L"

  Scenario: Convert 90 to "XC"
    Given I have the arabic number 90
    When I convert to Roman
    Then I should see the string "XC"

  Scenario: Convert 100 to "C"
    Given I have the arabic number 100
    When I convert to Roman
    Then I should see the string "C"

  Scenario: Convert 400 to "CD"
    Given I have the arabic number 400
    When I convert to Roman
    Then I should see the string "CD"

  Scenario: Convert 500 to "D"
    Given I have the arabic number 500
    When I convert to Roman
    Then I should see the string "D"

  Scenario: Convert 900 to "CM"
    Given I have the arabic number 900
    When I convert to Roman
    Then I should see the string "CM"

  Scenario: Convert 1000 to "M"
    Given I have the arabic number 1000
    When I convert to Roman
    Then I should see the string "M"

  Scenario: Convert 1666 to "MDCLXVI"
    Given I have the arabic number 1666
    When I convert to Roman
    Then I should see the string "MDCLXVI"

  Scenario: Convert 1999 to "MCMXCIX"
    Given I have the arabic number 1999
    When I convert to Roman
    Then I should see the string "MCMXCIX"

  Scenario: Convert 2018 to "MMXVIII"
    Given I have the arabic number 2018
    When I convert to Roman
    Then I should see the string "MMXVIII"

  Scenario: Convert 3999 to "MMMCMXCIX"
    Given I have the arabic number 3999
    When I convert to Roman
    Then I should see the string "MMMCMXCIX"

  # Failure Scenarios

  Scenario: Convert -1 should throw error
    Given I have the arabic number -1
    When I convert to Roman
    Then I should receive an error

  Scenario: Convert 0 should throw error
    Given I have the arabic number 0
    When I convert to Roman
    Then I should receive an error

  Scenario: Convert 4000 should throw error
    Given I have the arabic number 4000
    When I convert to Roman
    Then I should receive an error
