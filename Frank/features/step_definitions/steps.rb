Given /^I am running Pulse on an (ipad|iphone)$/ do |device|
  @device = device
end

Given /^I have not signed into Pulse before$/ do
  steps "Given I reset the #{@device} application"
end

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
  steps %{
    When I type "https://pulse.neudesic.com" into the "Enter the Pulse server address" text field
    When I type "#{ENV['PULSE_USER_NAME']}" into the "Enter your Pulse user name" text field
    When I type "#{ENV['PULSE_PASSWORD']}" into the "Enter your Pulse password" text field
    When I touch "Sign In"
  }
end

Then /^I will see my feed$/ do
  steps "Then I wait to not see a navigation bar titled \"Sign Into Pulse\""
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
  steps %{
    When I type "https://pulse.neudesic.com" into the "Enter the address of the Pulse server" text field
    When I type "test" into the "Enter your Pulse user name" text field
    When I type "#{ENV['PULSE_PASSWORD']}" into the "Enter your Pulse password" text field
    When I touch "Sign In"
  }
end

Then /^I will be told that my login is wrong$/ do
  pending
end

When /^I sign into Pulse with the wrong password$/ do
  pending
end