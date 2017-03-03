Feature: Simple CRUD operation using blogs

Scenario: Should be able to goto my Blog
Given I am on /
When I click on "My Blog" link
Then I should see "Listing Articles"

Scenario: Should be able to goto create new article
Given I am on /articles
When I click on "New Article" link
And I perform HTTP authentication as "dhh" with "secret"
Then I should see "New Article!!"

Scenario: Should be able to goto view article
Given I am on /articles
When I click on "Show" link
And I perform HTTP authentication as "dhh" with "secret"
Then I should see "Comments"

Scenario: Should be able to goto edit article
Given I am on /articles
When I click on "Edit" link
And I perform HTTP authentication as "dhh" with "secret"
Then I should see "Editing article"

Scenario: Should be able to create new article
Given I am on /articles/new
When I fill in "article[title]" with "Hello from Cucumber"
And I fill in "article[text]" with "Running the Cucumber Script"
And I click on "commit" button
Then I should see "Comments"
