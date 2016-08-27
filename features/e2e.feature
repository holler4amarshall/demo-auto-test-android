@e2e_tests

Feature: Shows in watch list update the statistics
	
	Background: 
		Given I am on the Shows screen
	    And I dismissed the Get Started dialogue

	Scenario: User adds show to their watch list via the Add Show screen and sees their statistics updated
		Given I access the "Statistics" screen via left menu
		And All statistics are currently zero
		When I access the "Shows" screen via left menu
		And I search for a show called "Mad Men"
		Then I select the matching show called "Mad Men"
		And I add "Mad Men" to my watch list via the dialogue
		When I tap on the back button
		Then I access the "Statistics" screen via left menu
		Then I see the number of my shows is different by "1"
		And I see the number of my shows with next episodes is different by "1"
		Then I see the number of my episodes is different by "3"
		And I see the number of my episodes watched is different by "0"

	Scenario: User marks a show as watched and sees their statistics and shows updated
		Given I access the "Statistics" screen via left menu
		And All statistics are currently zero
		When I access the "Shows" screen via left menu
		And I search for a show called "Mad Men"
		Then I select the matching show called "Mad Men"
		And I add "Mad Men" to my watch list via the dialogue
		When I tap on the back button
		Then I access the "Statistics" screen via left menu
		And I see the number of my episodes watched
		And I access the "Shows" screen via left menu
		Then I view details for "Mad Men"
		And I note the season and episode
		Then I mark the episode as watched
		Then I note that the season episode have incremented by "0" and "1"
		Then I tap on the back button
		When I access the "Statistics" screen via left menu
		Then I see the number of my episodes watched is different by "1"

	#Scenario template
	# Make Scenario #1 a template, adding different shows, and expecting different increase in number of stat. 	    




