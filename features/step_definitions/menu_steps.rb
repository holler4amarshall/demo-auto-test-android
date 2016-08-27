### This file contains step definitions for the menu.feature file ###


require_relative 'screens/menu'

#higher level steps

Given(/^I access the "([^"]*)" screen via left menu$/) do |menu_item|
  Menu.open_hamburger_menu
  Menu.verify_left_menu_displays
  Menu.select_menu_item(menu_item)
  sleep  2
  Menu.verify_heading_displays(menu_item)
end

#lower level steps

When(/^I tap on the hamburger button$/) do
  Menu.open_hamburger_menu
end

Then(/^I see the Left menu$/) do
  Menu.open_hamburger_menu
end

When(/^I tap on "([^"]*)" from the Left menu$/) do |menu_item|
  sleep  2
  Menu.select_menu_item(menu_item)
end

Then(/^I am on the "([^"]*)" screen$/) do |menu_item|
  Menu.verify_hamburger_displays
  Menu.verify_heading_displays(menu_item)
end
