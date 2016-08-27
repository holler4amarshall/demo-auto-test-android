module Navigation

	class << self
		include PageObject

		def click_back_button
			find_element(:id, "Navigate up").click
		end
	end
end
