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

Then /^I should not see "(.*?)"$/ do |message|
    page.has_no_content?(message)
end

When /^I click on "(.*?)" button$/ do |button|
  click_button(button)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in(field, :with => value) 
end

When /^I confirm popup$/ do
  page.driver.browser.switch_to.alert.accept    
end

When /^I dismiss popup$/ do
  page.driver.browser.switch_to.alert.dismiss
end

When /^I click on "(.*?)" link for the article with Title "(.*?)"$/ do |link, title|
  find('tr', text: title).click_link(link)
end

Then /^I should see article with Title "(.*?)"$/ do |title|
   allTitles = page.all('table td').map{|td| td.text}
   if allTitles.include?(title) 
      puts 'Found article'
   else 
      raise 'OOPS: did not find article'       
   end
end

Then /^I should not see article with Title "(.*?)"$/ do |title|
   allTitles = page.all('table td').map{|td| td.text}
   if allTitles.exclude?(title) 
      puts 'Did not find article'
   else 
      raise 'OOPS: found article'   
   end
end

When /^I perform HTTP authentication as "([^\"]*)" with "([^\"]*)"$/ do |username, password|
  if page.driver.respond_to?(:basic_auth)
    puts 'Responds to basic_auth'
    page.driver.basic_auth(username, password)
  elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_auth)
    puts 'Responds to browser_basic_auth'  
    page.driver.browser.basic_auth(username, password)  
  elsif page.driver.respond_to?(:basic_authorize)
    puts 'Responds to basic_authorize'
    page.driver.basic_authorize(username, password)
  elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
    puts 'Responds to browser_basic_authorize'
    page.driver.basic_authorize(username, password)
  else
    raise "I don't know how to log in!"
  end  
end
