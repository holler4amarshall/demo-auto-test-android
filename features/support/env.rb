require "appium_lib"
require "page-object"
require "pry" #used for debugging

def caps 
	{
		caps: {
			deviceName: "Samsung",
			platformName: "Android",
			app: "<path to test project>/demo-auto-test-android/features/support/SeriesGuide-31.1.apk",
            appPackage: "com.battlelancer.seriesguide",
            appActivity: ".ui.ShowsActivity",
			newCommandTimeout: "3600",
		appium_lib: { 
			wait: 30,
			debug: false 
			}
		}
	}

end

Appium::Driver.new(caps)
Appium.promote_appium_methods Object
