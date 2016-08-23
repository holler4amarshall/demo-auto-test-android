# This file contains the step definitions for the shows.feature file

#Add Show screen
search_field_placeholder = "Type a show name"

# Add Show screen step definitions

Given(/^I am on the Shows screen$/) do
  find_element(:id, "Open navigation drawer") #verify hamburger menu icon is displayed
  find_element(:xpath, ("//android.widget.TextView[@text='Shows']")) #verify Shows text is displayed
  find_element(:id, "buttonShowsAdd") #verify floating plus button is displayed
end


When(/^I tap on the floating plus button$/) do
  find_element(:id, "buttonShowsAdd").click
end


Then(/^I am on the Add Show screen$/) do
	actual_text = find_elements(id: "editTextSearchBar")[0].text #get search field placeholder text
	if search_field_placeholder != actual_text # check that expected placeholder text matches actual placeholder text
		fail("Expected: search field placeholder text to show #{search_field_placeholder}. Actual: value is #{actual_text}")
	end
	find_element(:xpath, ("//android.widget.LinearLayout")).find_element(:xpath, ("//android.widget.TextView[@text='ADD SHOW']")) #verify ADD SHOW label is displayed
end

When(/^I search for a show called "([^"]*)"$/) do |show_name|
	actual_placeholder = find_element(:id, "editTextSearchBar").text
	puts 'the actual placeholder text is: ' + actual_placeholder
	if actual_placeholder = search_field_placeholder
		find_element(:id,  "editTextSearchBar").send_keys(show_name +"\n")

		puts 'the user submitted a search for: ' + show_name
	end
end

Then(/^I select the matching show called "([^"]*)"$/) do |show_name|
	driver.manage.timeouts.implicit_wait = 30
  	if find_element(:xpath, ("//android.widget.TextView[@text='Searching failed, try again later.']"))
  		fail("Backend services are down. App unable to perform a successful search.")
  	else find_element(:xpath, ("//android.widget.TextView[@text='#{show_name}']")).click
  	end
end

Then(/^I add "([^"]*)" to my watch list via the dialogue$/) do |show_name|
  	find_element(:xpath, ("//android.widget.TextView[@text='#{show_name}']"))
  	find_element(:xpath, ("//android.widget.Button[@text='Add show']")).click
  	find_element(:id, "Mad Men is already in your show list.")
end

When(/^I tap on the back button$/) do
  	find_element(:id, "Navigate up").click
end




