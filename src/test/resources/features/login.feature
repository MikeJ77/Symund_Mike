@regression @SYMU-1056
Feature: Login Functionality

  Background:
    Given User is on the login page

  @SYMU-1046
  Scenario: User can login with valid credentials
    When User logs in with valid credentials
    Then the "Dashboard - Symund - QA" should be displayed

  @SYMU-1048
  Scenario Outline: User can not login with any invalid credentials
    When User logs in with "<username>" and "<password>"
    Then "Wrong username or password." message should be displayed

    Examples:
      | username        | password        |
      | invalidUsername | Employee123     |
      | Employee61      | invalidPassword |
      | invalidUsername | invalidPassword |
#      | employee61      | Employee123     |

  @SYMU-1049
  Scenario: User can not login with any invalid credentials
    When User logs in with "" and "Employee123"
    Then Please fill out this field. message should be displayed when username  is left empty

  @SYMU-1050
  Scenario: User can not login with any invalid credentials
    When User logs in with "Employee61" and ""
    Then Please fill out this field. message should be displayed when password  is left empty

  @SYMU-1064
  Scenario: User can see the password in a form of dots by default
    When User enters credentials of "Employee61" and "HiddenPassword"
    Then Verify that password is in a form of dots by default

  @SYMU-1051
  Scenario: User can see the password explicitly if needed
    When User enters credentials of "Employee61" and "HiddenPassword"
    And the eye icon next to the password box is clicked
    Then User should see the password explicitly

  @SYMU-1053
  Scenario: User can manage "Forgot Password" function
    When User verifies and clicks on the -Forgot password?-
    Then User verifies Reset Password on the following page

  @SYMU-1054
  Scenario: User can see valid placeholders on Username and Password fields
    Then User verifies the placeholder on username text box
    Then User verifies the placeholder on password text box