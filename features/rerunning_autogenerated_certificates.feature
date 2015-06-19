@api @data_kitten
Feature: Rerun autogenerated certificates

  Scenario: Rerun an autogenerated certificate with new data
    Given I am signed in as the API user
    And I want to create a certificate via the API
    And I apply a campaign "brian"
    And the field "publisherUrl" is missing from my metadata
    And my URL autocompletes via DataKitten
    And I request a certificate via the API
    And the certificate is created
    When I visit the campaign page for "brian"
    Then I should see "0 certificates published"
    When I add the field "publisherUrl" with the value "http://example.com" to my metadata
    And my URL autocompletes via DataKitten
    And I click "regenerate"
    Then I should see "1 certificate published"
