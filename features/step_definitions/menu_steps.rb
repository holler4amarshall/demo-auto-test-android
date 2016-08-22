### This file contains step definitions for the menu.feature file ###


When(/^I tap on the hamburger button$/) do
  find_element(:id, "Open navigation drawer").click
end

Then(/^I see the Left menu$/) do
  find_element(:id, "design_navigation_view") #verifies left menu view is displayed
end

When(/^I tap on "([^"]*)" from the Left menu$/) do |menu_item|
  find_element(:xpath, ("//android.widget.CheckedTextView[@text='#{menu_item}']")).click
end

Then(/^I am on the "([^"]*)" screen$/) do |menu_item|
  find_element(:id, "Open navigation drawer") #verify hamburger menu icon is displayed
  find_element(:xpath, ("//android.widget.TextView[@text='Statistics']")) #verify Statistics text is displayed
end
