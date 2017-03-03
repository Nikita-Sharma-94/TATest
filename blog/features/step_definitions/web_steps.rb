require 'uri'
require 'cgi'

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit "/#{page_name}"
end

When /^I click on "(.*?)" link$/ do |link|
  first(:link, link).click
end

Then /^I should see "(.*?)"/ do |message|
  page.has_content?(message)
end

Given /^I perform HTTP authentication as "([^\"]*)" with "([^\"]*)"$/ do |username, password|
    if page.driver.respond_to?(:basic_auth)
        page.driver.basic_auth(username, password)
    elsif page.driver.respond_to?(:basic_authorize)
        page.driver.basic_authorize(username, password)
    elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
        page.driver.browser.basic_authorize(username, password)
    else
        raise "I don't know how to log in!"
    end
end

When /^I click on "(.*?)" button$/ do |button|
  click_button(button)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in(field, :with => value) 
end