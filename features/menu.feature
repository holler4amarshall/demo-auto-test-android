@component_tests
Feature: Left menu
	Scenario: Tap Statistics from Left menu to display Statistics screen
	    Given I am on the Shows screen
	    When I tap on the hamburger button
	    Then I see the Left menu
	    #When I tap on Statistics from the Left menu
	    Then I am on the "Statistics" screen


		