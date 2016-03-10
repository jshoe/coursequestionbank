Feature: add a tag to existing question
  As an CourseQuestionBank Administrator
  So that I can quickly find questions appropriate for my class
  I want to add tags to questions

  As an CourseQuestionBank Administrator
  So that I will be able to search for related questions,
  I want to tag my questions

  As an CourseQuestionBank Administrator
  So that I can categorize my questions,
  I want to tag my questions

 Background:
    Given I am signed in with uid "1234" and provider "github"
    And I have uploaded 'micro_quizzes.txt'
    And I am on the dashboard
    When I follow "start a new collection"
    And I fill in "collection_name" with "yolo"
    And I press "Create"
    Then I should be on the dashboard
    And I add problem containing 'Raffi' to collection 'yolo'
    And I should see Collection 'yolo' in the database
    And I am on the dashboard
    When I follow "yolo"


  Scenario: enter tags but did not select problems (sad path)
    When I fill in "Enter tags, comma-separated" with "test1"
    When I press "Add Tags"
    Then I should see "You need to select a problem."

  Scenario: did not enter tags (sad path)
    When I press "Add Tags"
    Then I should see "You need to enter a tag."


  Scenario: adding tag results in that tag being displayed on the page
    When I fill in "Enter tags, comma-separated" with "test1"
    When I mark all the boxes
    When I press "Add Tags"
    Then I should see "Tags were added."
    
  Scenario:remove tag
    # And I add tag "tag1" to problem "1"
    # And I am on the problems page
    # And I remove tag "1" from problem "1"
    # And I am on the problems page

  Scenario: adding an existing tag to a question in the collection view

  Scenario: adding a new tag to a question in the collection view

  Scenario: adding an existing tag to a question in the question view

  Scenario: adding a new tag to a question in the question view
