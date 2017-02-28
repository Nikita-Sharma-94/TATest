Feature: Simple CRUD operation using blogs

Scenario: Should be able to goto my Blog
Given I am on /
When I click on "My Blog" link
Then I should see "Listing Articles"