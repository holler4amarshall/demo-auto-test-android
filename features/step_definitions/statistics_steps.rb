### step definitions specific to the statistics screen ###

#note to tester: create function for logic 
Then(/^I see the number of my "([^"]*)"$/) do |statistic|

$actual_shows = 0
$actual_sub_show_stat = 0
$actual_episodes = 0
	
	if statistic == "shows"
		stat_id = "textViewStatsShows"
		$actual_shows = Integer(find_element(:xpath, ("//android.widget.TextView[contains(@resource-id, '#{stat_id}')]")).text)
  		puts 'the number of ' + statistic + ' is: ' + String($actual_shows) #log_message


  	elsif statistic == "shows with next episodes"
  		sub_stat_id = "textViewStatsShowsWithNext"
		sub_show_label = 'WITH NEXT EPISODES'
		$actual_sub_show_stat = Integer(find_element(:xpath, ("//android.widget.TextView[contains(@resource-id, '#{sub_stat_id}')]")).text[0]) #get value of 2nd level statistic
  		puts 'the number of ' + statistic + ' is: ' + String($actual_sub_show_stat) #log_message
	
	else statistic == "episodes"
		stat_id="textViewStatsEpisodes"
		sub_stat_id="textViewStatsEpisodesWatched"
		sub_stat_label="WATCHED"
		$actual_episodes = Integer(find_element(:xpath, ("//android.widget.TextView[contains(@resource-id, '#{stat_id}')]")).text)
  		puts 'the number of ' + statistic + ' is: ' + String($actual_episodes) #log_message
	
	end

end


### Create function for logic (which is repeated x 3 below)
### Split string by digits/alpha and then grab the numbers only in order to calculate the totals correctly. 

Then(/^I see the number of my "([^"]*)" has increased by "([^"]*)"$/) do |statistic, number_increase|
	
	if statistic == "shows"
		stat_id = "textViewStatsShows"
		actual_increase = (total_shows = Integer(find_element(:xpath, ("//android.widget.TextView[contains(@resource-id, '#{stat_id}')]")).text) - Integer($actual_shows))
		#actual_increase = total_shows - Integer($actual_shows)
		if actual_increase != Integer(number_increase)
			fail("Actual: the increase in number of #{statistic}  is: #{(actual_increase)} #{statistic}. However, expected is: #{number_increase} #{statistic}.")
  		  	end

  	elsif statistic == "shows with next episodes"
  		sub_stat_id = "textViewStatsShowsWithNext"
		sub_show_label = 'WITH NEXT EPISODES'
		actual_increase = (total_sub_show_stat = Integer(find_element(:xpath, ("//android.widget.TextView[contains(@resource-id, '#{sub_stat_id}')]")).text[0]) - Integer($actual_sub_show_stat)) #get value of 2nd level statistic
		if actual_increase != Integer(number_increase)
			fail("Actual: the increase in number of #{statistic}  is: #{(actual_increase)} #{statistic}. However, expected is: #{number_increase} #{statistic}.")
	end
  
	
	else statistic == "episodes"
		stat_id="textViewStatsEpisodes"
		sub_stat_id="textViewStatsEpisodesWatched"
		sub_stat_label="WATCHED"
		actual_increase = (total_episodes_stat = Integer(find_element(:xpath, ("//android.widget.TextView[contains(@resource-id, '#{stat_id}')]")).text[0]) - Integer($actual_episodes)) 
  		puts 'the number of ' + statistic + ' is: ' + String($actual_episodes)
  		if actual_increase != Integer(number_increase)
			fail("Actual: the increase in number of #{statistic}  is: #{(actual_increase)} #{statistic}. However, expected is: #{number_increase} #{statistic}.")
	end
  end
end




