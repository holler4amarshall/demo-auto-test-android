require "appium_lib"

def caps 
	{
		caps: {
			deviceName: "Samsung",
			platformName: "Android",
			app: "/<path to demo-auto-test-android project>/android_automation/features/support/SeriesGuide-31.1.apk",
            appPackage: "com.battlelancer.seriesguide",
            appActivity: ".ui.ShowsActivity",
			newCommandTimeout: "3600",
		appium_lib: { 
			wait: 20,
			debug: false 
		}
		}
	}

end

Appium::Driver.new(caps)
Appium.promote_appium_methods Object
