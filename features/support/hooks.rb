Before do 
	#sleep 5
	$driver.start_driver
end

After do |scenario|
	#screenshots functionality
	#create directory for the screenshots if it doesn't exist
	if scenario.failed?
		unless File.directory?("screenshots")
			FileUtils.mkdir_p("screenshots")
		end
	#create new file for screenshot, named with current date/time
	time_stamp = Time.now.strftime("%Y-%m-%d-_%H.%M.%S")
	screenshot_name = "#{time_stamp}.png"
	screenshot_file = File.join("screenshots", screenshot_name)

	#take screenshot
	$driver.screenshot(screenshot_file)
	embed("screenshots", screenshot_file, "image/png")
	end
	$driver.driver_quit
end

AfterConfiguration do
	FileUtils.rm_r("screenshots") if File.directory?("screenshots")
	end
