module Statistics

	class << self

		public

		$shows_count = []
		$shows_with_next_episodes_count = []
		$episodes_count = []
		$episodes_watched_count = []
		

		def get_shows
		''' method to get the numeric value from the latest statistics: shows field'''
			value = (find_element(:id, "textViewStatsShows").text)
			$shows_count.push(value)
			index = $shows_count.count.to_i - 1
			return $shows_count[index]
		end


		def get_shows_with_next_episodes
		''' method to get the numeric value from the statistics: shows with next episodes field'''
			value = (find_element(:id, "textViewStatsShowsWithNext").text.to_s.scan(/[A-Z]+\d*|\d+/)[0])
			$shows_with_next_episodes_count.push(value)
			index = $shows_with_next_episodes_count.count.to_i - 1
			return $shows_with_next_episodes_count[index]
		end

		def get_episodes
		''' method to get the numeric value from the statistics: episodes field'''
			value = (find_element(:id, "textViewStatsEpisodes").text)
			$episodes_count.push(value)
			index = $episodes_count.count.to_i - 1
			return $episodes_count[index]
		end

		def get_episodes_watched
		''' method to get the numeric value from the statistics: episodes watched field'''
			value = (find_element(:id, "textViewStatsEpisodesWatched").text.to_s.scan(/[A-Z]+\d*|\d+/)[0])
			$episodes_watched_count.push(value)
			index = $episodes_watched_count.count.to_i - 1
			return $episodes_watched_count[index]
		end


		def verify_value(type, type_counter, index, expected)
		''' method to check that the actual value is correct according to the expected value '''
			fail "error: " + type + "actual: " + type_counter[index].to_s + " did not match the expected value: " + expected.to_s unless type_counter[index].to_i == expected.to_i
			puts type + "actual: " + type_counter[index].to_s  ##log file msg
		end	

		def verify_difference(type, type_counter, index, expected)
		''' method to check the difference in original value to new value is according to expectations'''
			#index = type_counter.count.to_i
			difference = (type_counter[index].to_i) - type_counter[index - 1].to_i
		    fail "error: " + type + "actual: " + difference.to_s + " did not match the expected value: " + expected.to_s unless type_counter[index].to_i == expected.to_i
		end

	end

end

