# This file contains the step definitions for the shows.feature file

require_relative 'screens/shows'
require_relative 'screens/menu'


# Add Show screen step definitions

Given(/^I am on the Shows screen$/) do
  Menu.verify_hamburger_displays
  Menu.verify_heading_displays(Shows)
  Shows.floating_plus_icon_displays
end

Given(/^I dismissed the Get Started dialogue$/) do
  Shows.dismiss_get_started_dialogue
end


When(/^I tap on the floating plus button$/) do
  Shows.tap_floating_plus_icon
end


Then(/^I am on the Add Show screen$/) do
	Shows.verify_add_shows_tab_displays
end

When(/^I search for a show called "([^"]*)"$/) do |show_name|
	Shows.tap_floating_plus_icon
	Shows.search_show(show_name)
	sleep  3
end

Then(/^I select the matching show called "([^"]*)"$/) do |show_name|
  	Shows.select_show(show_name)
  	sleep  8
end

Then(/^I add "([^"]*)" to my watch list via the dialogue$/) do |show_name|
	Shows.add_show(show_name)
end

Then(/^I view details for "([^"]*)"$/) do |show_name|
  	Shows.view_show_details(show_name)
end

Then(/^I note the season and episode$/) do
  Shows.find_next_season_and_episode
end

Then(/^I mark the episode as watched$/) do
  Shows.click_set_watched
end

Then(/^I note that the season episode have incremented by "([^"]*)" and "([^"]*)"$/) do |increment1, increment2|
	Shows.check_season_episode_increments(increment1, increment2)
end





