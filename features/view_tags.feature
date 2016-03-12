Feature: User can view tags under a question in question and collection views
  As an instructor
  So that I can easily see which topics a question relates to
  I want to view a question’s tags

  Scenario: view tags in question view
    Given I am signed in with uid "1234" and provider "github"
    And I have uploaded 'foo.txt'
    And I am on the CourseQuestionBank home page
    And I follow "View 60"
    Then I should see "test_tag"
    Then I should see "test_tag2"
