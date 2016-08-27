module Shows

	class << self
		include PageObject

		$season_and_episode = []

		
		def dismiss_get_started_dialogue
			find_element(:id, "buttonFirstRunDismiss").click
		end


		def floating_plus_icon_displays
			find_element(:id, "buttonShowsAdd")
		end


		def tap_floating_plus_icon
			find_element(:id, "buttonShowsAdd").click
		end

		def verify_search_show_field_placeholder
			fails "placeholder text incorrect" unless (find_element(:id, "editTextSearchBar").text) == "Type a show name"
		end

		def verify_add_show_tab_displays
			find_element(:xpath, ("//android.widget.LinearLayout")).find_element(:xpath, ("//android.widget.TextView[@text='ADD SHOW']")) #verify ADD SHOW label is displayed
		end

		def search_show(show_name)
			if (find_element(:id, "editTextSearchBar").text) == "Type a show name"
				find_element(:id,  "editTextSearchBar").send_keys(show_name +"\n")
				puts 'the user submitted a search for: ' + show_name
			end
		end

		def select_show(show_name)
			find_element(:xpath, ("//android.widget.TextView[@text='#{show_name}']")).click
		end


		def add_show(show_name)
		 	find_element(:xpath, ("//android.widget.TextView[@text='#{show_name}']"))
  			find_element(:xpath, ("//android.widget.Button[@text='Add show']")).click
  			find_element(:id, "Mad Men is already in your show list.")
		end
		#note to self - duplication of method above. this could be removed. 
		
		def view_show_details(show_name)
			find_element(:xpath, ("//android.widget.TextView[@text='#{show_name}']")).click
		end

		def find_next_season_and_episode
			$season_and_episode = (find_element(:id, "episodeInfo").text.to_s.scan(/[A-Z]+\d*|\d+/))
			index = ($season_and_episode.count)
			$season = 'season = ' + $season_and_episode[index - 3].to_s
			$episode = puts 'episode = ' + $season_and_episode[index - 1].to_s
		end

		def click_set_watched
			find_element(:id, "buttonEpisodeWatched").click
		end

		def check_season_episode_increments(increment1, increment2)
			sleep  2
			data = (find_element(:id, "episodeInfo").text.to_s.scan(/[A-Z]+\d*|\d+/))
			$season_and_episode.push(data)
			#puts $season_and_episode
		end

	end

end
