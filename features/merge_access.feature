Feature: Only admin can merge articles
  As a typical user without admin privilges
  In order to faciliate the website's features
  I want to be denied access of merging articles
  
  Background:
    Given the blog is set up
    Given the following users exist:
  	| login 		| password 			| email 		    | name     | profile_id     | state	|
	  | user1     | password      | test@test.com	| Bob	     | 100 	      		| active|
    Given the following articles exist:
    | id    | title                   | body | author |
    | 100   | test                    | blah | me     |
    | 101   | hello                   | 2blah | me2    |

  Scenario: New article page should not show merging option
    Given I am on the new article page
    Then I should not see "Merge With This Article"
    
  Scenario: A non-admin cannot merge articles
    Given I am logged into the admin panel as "user1"
    Given I am on the edit article page for "test" as "user1"
    Then I should not see "Merge With This Article"
