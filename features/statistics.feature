@component_tests
Feature: view stastics for my shows, episodes and movies
	Scenario: Get my stastics
	    Given I am on the Shows screen
	    When I tap on the hamburger button
	    And I tap on "Statistics" from the Left menu
	    Then I am on the "Statistics" screen
	    

