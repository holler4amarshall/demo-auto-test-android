### step definitions specific to the statistics screen ###

#associated files
require_relative 'screens/statistics_screen'

# step definitions

And(/^All statistics are currently zero$/) do
	Statistics.get_shows
  	Statistics.get_shows_with_next_episodes
  	Statistics.get_episodes
  	Statistics.get_episodes_watched
  	Statistics.verify_value('shows ', $shows_count, 0, 0)
  	Statistics.verify_value('shows_nxt_ep ', $shows_with_next_episodes_count, 0, 0)
  	Statistics.verify_value('ep ', $episodes_count, 0, 0)
  	Statistics.verify_value('ep_watched ', $episodes_watched_count, 0, 0)
end

Then(/^I see the number of my shows is different by "([^"]*)"$/) do |expected_increase|
	Statistics.get_shows
	#arguments below are: type of statistic, counter array, array index, expected increase
	Statistics.verify_difference('shows ', $shows_count, 1, expected_increase)
end

And(/^I see the number of my shows with next episodes is different by "([^"]*)"$/) do |expected_increase|
	Statistics.get_shows_with_next_episodes
	Statistics.verify_difference('shows_nxt_ep', $shows_with_next_episodes_count, 1, 1)
end 

And(/^I see the number of my episodes is different by "([^"]*)"$/) do |expected_increase|
	Statistics.get_episodes
	Statistics.verify_difference('ep  ', $episodes_count, 1, 93)
end 

And(/^I see the number of my episodes watched is different by "([^"]*)"$/) do |expected_increase|
	Statistics.get_episodes_watched
	Statistics.verify_difference('ep_watched ', $episodes_watched_count, 1, 0)
end

#### Only used for the semi-obsolete component tests:- 

Then(/^I see the number of my shows$/) do
	Statistics.get_shows
	puts "got shows: #{$shows_count[0]}"
end

Then(/^I see the number of my shows with next episodes$/) do
  	Statistics.get_shows_with_next_episodes
	puts "the number of shows with next episodes is" + $shows_with_next_episodes_count[0]
end

Then(/^I see the number of my episodes$/) do
  	Statistics.get_episodes
	puts "the number of episodes is" + $episodes_count[0]
end

Then(/^I see the number of my episodes watched$/) do
  Statistics.get_episodes_watched
end


