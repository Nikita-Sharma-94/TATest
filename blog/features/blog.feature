Feature: Simple CRUD operation using blogs

Scenario: Should be able to goto my Blog
Given I am on /
When I click on "My Blog" link
Then I should see "Listing Articles"

Scenario: Should be able to goto create new article and back
Given I am on articles
When I click on "New Article" link
Then I should see "New Article!!"
When I click on "Back" link
Then I should see "Listing Articles"

Scenario: Should be able to create new article
Given I am on articles/new
When I fill in "article[title]" with "Hello from Cucumber create"
And I fill in "article[text]" with "Running the Cucumber Script"
And I click on "Create Article" button
Then I should see "Comments"

Scenario: should not be able to create new article if the titile length is less than 5 
Given I am on articles/new
When I click on "Create Article" button
Then I should see "2 errors"

Scenario: Should be able to goto view/show article and back
Given I am on articles
When I click on "Show" link
Then I should see "Comments"
When I click on "Back" link
Then I should see "Listing Articles"

Scenario: Should be able to add a comment
Given I am on articles
When I click on "Show" link for the article with Title "Hello from Cucumber create"
Then I should see "Comments"
When I fill in "comment[commenter]" with "Cucumber"
And I fill in "comment[body]" with "Cucumber is Cool!"
And I click on "Create Comment" button
Then I should see "Cucumber is Cool!"

Scenario: Should not be able to destroy/delete comment if cancel is pressed on popup 
Given I am on articles
When I click on "Show" link for the article with Title "Hello from Cucumber create"
Then I should see "Comments"
When I click on "Destroy Comment" link
And I dismiss popup
Then I should see "Cucumber is Cool!"

Scenario: Should be able to destroy/delete comment if ok is pressed on popup 
Given I am on articles
When I click on "Show" link for the article with Title "Hello from Cucumber create"
Then I should see "Comments"
When I click on "Destroy Comment" link
And I confirm popup
Then I should not see "Cucumber is Cool!"

Scenario: Should be able to goto edit/update from view/show article
Given I am on articles
When I click on "Show" link
Then I should see "Comments"
When I click on "Edit" link
Then I should see "Editing article"

Scenario: Should be able to goto edit/update article and back
Given I am on articles
When I click on "Edit" link
Then I should see "Editing article"
When I click on "Back" link
Then I should see "Listing Articles"

Scenario: Should be able to edit/update article
Given I am on articles
When I click on "Edit" link for the article with Title "Hello from Cucumber create"
Then I should see "Editing article"
When I fill in "article[title]" with "Hello from Cucumber update"
And I fill in "article[text]" with "Running the Cucumber Script. Yay!"
And I click on "Update Article" button
Then I should see "Hello from Cucumber update"

Scenario: Should not be able to edit/update article if the titile length is less than 5 
Given I am on articles
When I click on "Edit" link
Then I should see "Editing article"
When I fill in "article[title]" with "Hey"
And I fill in "article[text]" with "Running the Cucumber Script. Yay!"
And I click on "Update Article" button
Then I should see "error"

Scenario: Should not be able to destroy/delete article if cancel is pressed in the dialog box
Given I am on articles
When I click on "Destroy" link for the article with Title "Hello from Cucumber update"
And I dismiss popup
Then I should see article with Title "Hello from Cucumber update"

Scenario: Should able to destroy/delete article if ok is pressed in the dialog box
Given I am on articles
When I click on "Destroy" link for the article with Title "Hello from Cucumber update"
And I confirm popup
Then I should not see article with Title "Hello from Cucumber update"
