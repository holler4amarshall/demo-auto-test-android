When(/^I swipe from left to right$/) do
  Appium::TouchAction.new.swipe(start_x: 0.01, start_y: 0.5, end_x: 0.5, end_y: 0.5, duration: 800).perform
end

When(/^I swipe from right to left$/) do
  Appium::TouchAction.new.swipe(start_x: 0.99, start_y: 0.5, end_x: 0.5, end_y: 0.5, duration: 800).perform
end