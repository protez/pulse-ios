Feature: Sign Into Pulse (iPad)
  In order to access my feed and post status messages to Pulse
  As a user
  I want to sign into Pulse

  Background: Running on an iPad
    Given I am running Pulse on an ipad

  Scenario: Successfully sign into Pulse
    Given I have not signed into Pulse before
    When I sign into Pulse
    Then I will see my feed

  Scenario: Retrieve password from keychain
    Given I have previously signed into Pulse
    When I start Pulse
    Then I will see my feed

  Scenario: Prompt for password if password changes
    Given I have changed my Pulse password
    When I start Pulse
    Then I will be prompted for my new password

  Scenario: User name is incorrect
    Given I have not signed into Pulse before
    When I sign into Pulse with the wrong user name
    Then I will be told that my login is wrong

  Scenario: Password is incorrect
    Given I have not signed into Pulse before
    When I sign into Pulse with the wrong password
    Then I will be told that my login is wrong