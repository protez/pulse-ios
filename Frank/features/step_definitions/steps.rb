def app_path
  ENV['APP_BUNDLE_PATH'] || (defined?(APP_BUNDLE_PATH) && APP_BUNDLE_PATH)
end

Given /^I have not signed into Pulse before$/ do
  steps "Given I reset the ipad application"
end

APPLICATIONS_DIR = "/Users/#{ENV['USER']}/Library/Application Support/iPhone Simulator/5.1/Applications"
USER_DEFAULTS_PLIST = "Library/Preferences/com.neudesic.Pulse-Acceptance-Tests.dist.plist"

Given /^I reset the (iphone|ipad) application$/ do |device|
  steps "When I quit the simulator"
  Dir.foreach(APPLICATIONS_DIR) do |item|
    next if item == '.' or item == '..'
    if File::exists?("#{APPLICATIONS_DIR}/#{item}/#{USER_DEFAULTS_PLIST}")
      FileUtils.rm "#{APPLICATIONS_DIR}/#{item}/#{USER_DEFAULTS_PLIST}"
    end
  end
  steps "Given I launch the #{device} application"
end

Given /^I launch the (iphone|ipad) application$/ do |device|
  launch_app app_path, '5.1', device
end

When /^I sign into Pulse$/ do
  pending
end

Then /^I will see my feed$/ do
  pending
end

Given /^I have previously signed into Pulse$/ do
  pending
end

When /^I start Pulse$/ do
  pending
end

Given /^I have changed my Pulse password$/ do
  pending
end

Then /^I will be prompted for my new password$/ do
  pending
end

When /^I sign into Pulse with the wrong user name$/ do
  pending
end

Then /^I will be told that my login is wrong$/ do
  pending
end

When /^I sign into Pulse with the wrong password$/ do
  pending
end