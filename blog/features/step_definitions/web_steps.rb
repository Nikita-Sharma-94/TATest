require 'uri'
require 'cgi'

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit "/#{page_name}"
end

When(/^I click on "(.*?)" link$/) do |link|
    click_link(link)
end

Then /^I should see "(.*?)"/ do |message|
  page.has_content?(message)
end

