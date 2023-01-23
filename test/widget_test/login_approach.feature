Feature: LoginApproach
  Scenario: Test Login Approach
    Given the app is running
    Then  I See {"Guest"} text
    Then  I See {"SMS"} text
    Then  I tap {Icons.account_circle} icon
    When  I tap {"Continue"} text and wait

    Then  I See {"Locations"} text