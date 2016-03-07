#Note: Before merging articles you should verify that both specified articles exist, and that they are not the same article.

Feature: Merge Articles
  As a blog administrator
  In order to organize my thoughts and articles
  I want to be able to merge articles together on my blog
  
  Background:
    Given the blog is set up
    Given the following articles exist:
    | title                   | body  | author |
    | test                    | blah  | me     |
    | hello                   | 2blah | me2    |
    Given the following comments exist:
    | author     | body                | article_id |
    | Bob        | Alice sucks         | 3          |
    | Alice      | Bob sucks           | 4          |

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    Given I am on the edit article page for "test"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    When I press "Merge"
    Then the merged article "test" should have body "blah 2blah"

  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article
    Given I am logged into the admin panel
    Given I am on the edit article page for "test"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    When I press "Merge"
    Then the comment "Bob sucks" should point to the article "test"
