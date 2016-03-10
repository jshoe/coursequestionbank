Feature: User can add tags to questions at the time of import
  As an CourseQuestionBank Administrator
  So that I can quickly find questions appropriate for my class
  I want to add tags to questions
  I want to add tags to questions when I import them
  
Background:
	Given I am signed in with uid "1234" and provider "github"
	And I am on the CourseQuestionBank home page
	
Scenario: add an existing tag to the currently imported questions
  When I have uploaded 'micro_quizzes.txt'
  Then I should see "Your quiz was successfully uploaded!"
  Then I should see "Review them below:"
#   Then I should see
#   And I add tag "tag1" 
#   And I check problem "1"
#   And I check problem "2"
#   When I press submit 

Scenario: need to enter a tag (sad path)
  When I have uploaded 'micro_quizzes.txt'
  # When I fill in "Enter tags, comma-separated" with "test1"
  When I click Add Tags
#   Given I am on the collections page
#   When I press "Add Tags" 
  Then I should see "You need to select a problem."
#You need to enter a tag."