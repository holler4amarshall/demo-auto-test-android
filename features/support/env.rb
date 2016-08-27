require "appium_lib"
require "page-object"

def caps 
	{
		caps: {
			deviceName: "Samsung",
			platformName: "Android",
			app: "/Users/hollycopter/Documents/workspace/udemy/ruby_cucumber_android/android_automation2/demo-auto-test-android/features/support/SeriesGuide-31.1.apk",
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