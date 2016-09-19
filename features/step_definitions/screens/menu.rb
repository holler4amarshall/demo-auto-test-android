module Menu

	class << self
		include PageObject

		def verify_hamburger_displays
			find_element(:id, "Open navigation drawer")
		end
		

		def open_hamburger_menu
			find_element(:id, "Open navigation drawer").click
		end



		def verify_left_menu_displays
			find_element(:id, "design_navigation_view")
		end



		def select_menu_item(menu_item)
			set_wait
			find_element(:xpath, ("//android.widget.CheckedTextView[@text='#{menu_item}']")).click
		end


		def verify_heading_displays(menu_item)
			find_element(:xpath, ("//android.widget.TextView[@text='#{menu_item}']")) #verify screen heading is displayed
		end
	end
end
