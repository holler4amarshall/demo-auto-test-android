@e2e_tests

Feature: Shows in watch list update the statistics
	
	Scenario: User adds show to their watch list via the Add Show screen and sees their statistics updated

		Given I am on the Shows screen
	    When I tap on the hamburger button
	    And I tap on "Statistics" from the Left menu
	    Then I am on the "Statistics" screen
	    And I see the number of my "shows"
	    Then I see the number of my "shows with next episodes"
	    And I see the number of my "episodes"
		When I tap on the hamburger button
		And I tap on "Shows" from the Left menu
		When I tap on the floating plus button
		And I search for a show called "Mad Men"
		Then I select the matching show called "Mad Men"
		And I add "Mad Men" to my watch list via the dialogue
		When I tap on the back button
		Then I tap on the hamburger button
		And I tap on "Statistics" from the Left menu
		Then I see the number of my "shows" has increased by "1"
		And I see the number of my "shows with next episodes" has increased by "1"
		Then I see the number of my "episodes" has increased by "3"

	#Scenario: User marks a show as watched and sees their statistics updated
		Scenario: <enter scenario title>
		    When 

	#Scenario template
	# Make Scenario #1 a template, adding different shows, and expecting different increase in number of stat. 	    




