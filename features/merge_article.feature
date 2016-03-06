#Note: Before merging articles you should verify that both specified articles exist, and that they are not the same article.

Feature: Merge Articles
  As a blog administrator
  In order to organize my thoughts and articles
  I want to be able to merge articles together on my blog
  
  Background:
    Given the blog is set up
    Given the following articles exist:
    | title                   | body | author |
    | test                    | blah | me     |
    | hello                   | 2blah | me2    |

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    Given I am on the edit article page for "test"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    When I press "Merge"
    Then the merged article "test" should have body "blah 2blah"
    
#   Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article)
#     Given I am on the new article page
#     When I fill in "article_id" with ""
#     When I press "Merge With This Article"
#     Then the author of the merged article should be "" or ""

#   Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article
#     Given I am on the new article page
#     When I fill in "article_id" with ""
#     When I press "Merge With This Article"
    
    
#   Scenario: The title of the new article should be the title from either one of the merged articles
#     Given I am on the new article page
#     When I fill in "article_id" with ""
#     When I press "Merge With This Article"
#     Then the title of the merged article should be "" or ""
    
