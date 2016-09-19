# demo-auto-test-android

This project was created in order to demonstrate a working example of automated functional test cases for [SeriesGuide](https://github.com/UweTrottmann/SeriesGuide). SeriesGuide is a public licensed Android app created by Uwe Trottman that allows Android users to track tv shows and episodes. 


## Test project
This test project aims to demonstrate how Appium, Cucumber and Ruby can be used in order to create automated test cases for an Android app. 

This project has been created and tested on Mac OSX El Capitan with Appium v. 1.5.3, Genymotion Custom Phone - 6.0.0 - API 23 - 768x1280, ruby v. 2.0.0p648. 

### Pre-requisites
In order to run the test project, you will require the following installations: 

* Github [demo-auto-test-android](https://github.com/holler4amarshall/demo-auto-test-android) project downloaded on your computer

  1. Create a folder on your computer for 'android-automation'
  2. Download this repository to folder from step #1, per standard Git procedure.  
  
Note that the test project already includes Uwe Trottman's Series Guide inside /features/support
  
* Update the 'demo-auto-test-android' project's env.rb file to point cucumber to the app (.apk) file on your local machine

  3. Modify the env.rb file (/android_automation/features/support/env.rb) within the demo-auto-test-android project so that it points to the app (SeriesGuide-31.1.apk) file. 

* Install [Android-SDK](https://developer.android.com/studio/index.html) on your computer.
For the purpose of this project, you will only need command line tools.
Alternatively, these tools will be provided as part of Android Studio

* Install / Configure [Appium](http://appium.io) on your computer as follows: 
  1.  Set the following Basic Android settings
    1.  Application, App path: point to the SeriesGuide-31.1.apk file inside folder from step #1
    2.  Capabilities, Platform name: Android
    3.  Capabilities, Automation name: Appium
    4.  Capabilities, Platform version: 6.0
    5.  Capabilities, Device name: Samsung
  2.  Set the following Advanced Android settings
    1.  Advanced, Android SDK Path: point to your 'android-sdk' folder on your local machine

* Install / Configure [Genymotion](https://docs.genymotion.com/Content/01_Get_Started/Installation.htm)  on your computer as follows: 
  1.  Add a virtual device: 'Custom Phone - 6.0.0 - API 23 - 768x1280

* Note that the tests can be executed on real device or different emulators other than noted above. If changing these settings, please ensure that Appium points to the correct device. 

* Install SeriesGuide application to emulator via command line (these commands may need to be executed in your Android-SDK folder)


          >> ./adb devices
          >> ./adb install /<path to android-automation folder >/features/support/SeriesGuide-31.1.apk

     

### Execute tests
Following successful installation and configuration according to the pre-requisites, you can execute the tests using the following process: 

1. Play Genymotion emulator (Custom Phone - 6.0.0 - API23 - 768x1280).
Check successful by accessing your android-sdk folder on your command line, and executing the following code. The successfully connected device should appear in the output. 

          >>  ./adb devices
 

2. Launch Appium (ensure it is listening to your emulator)

3. Run cucumber tests:

Via command line, access the root folder where you saved the test project (e.g., 'android-automation')

    >> cucumber -p e2e_tests
    
(this will initiate the tests that are included in the *profile*: e2e_tests. html reports are available when using this command)


Alternatively:

    >> cucumber
    
(this will execute all tests)

    >> cucumber -t @e2e_tests

(this will initiate the tests that are tagged as e2e, eg: tests for adding a show, counting the show statistics, watching a show and re-counting the show statistics)

    >> cucumber -t @component_tests
(this will initiate tests tagged as component tests)

When the test cases are running, you can watch the log file output on the command line, and you can see the steps being executed automatically in your Genymotion emulator. 

### Example test output

#### Log File Output: 
Note that the test cases are a work in progress. The sample output here provides an indication of the log file output following successful run of the test cases. Note that the test cases will be refactored in order to improve the tests themselves and the reports. 

![sample cucumber test output](https://codeontheroaddotinfo.files.wordpress.com/2016/08/screen-shot-2016-09-19-at-2-44-20-pm.png?w=1320)

#### HTML Reports
HTML Reports are configured in the cucumber.yml file. After executing the tests, the report can be found by accessing the project's 'demo-auto-test-android/report.html' file 

### Example html report
![sample cucumber html report](https://codeontheroaddotinfo.files.wordpress.com/2016/08/screen-shot-2016-09-19-at-2-46-41-pm.png?w=1320)


### Test structure
* The 'env.rb' file contains libraries, methods and configuration details specific to the application and devices under test. This file may be required to be edited for your individual needs. 

* The 'hooks.rb' file contains set up and tear down steps for running the cucumber steps. 

* The 'cucumber.yml' file contains a list of profiles & configuration to enable reporting to logs and html report.  

* Tags have been used to categorise tests. Eg @e2e_tests is used to categorise e2e regression style tests, @component_tests is used to categorise tests that will be more suited to lower level testing, @wip is used to categorise work in progress test cases for debugging purposes when creating tests. 

* Profiles have been used to categorise tags. 

* Specification by example (scenario_template) ... TBA. 

### What's to come in the next commits? 
As of 23/8 early AM, the test cases are written in very basic format. 
Plans for future commits include: 
* refactor test cases to include functions/methods in order to reduce code repetition
* add cucumber's specification by example technique in order to run data driven tests using a table of data
* create better reports
* increase test coverage
* improve readability by using page object pattern

### Future documentation
* Document best practice for cucumber test framework, including data page modelling

### Author's notes
In order to create the tests, I used a number of tools not mentioned in the set up above. It may be beneficial to know these additional steps in order to understand the full framework. 

* text editor: [Sublime Text](https://www.sublimetext.com/download) 
* text editor plugins: [Package Control.Sublime Package](https://packagecontrol.io/installation), including selections: sublime gherkin formatter, cucumber-completion
* UIAutomatorViewer: (to inspect elements in app): part of Android-SDK
