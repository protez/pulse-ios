###############################################################################
#
# env.rb
#
# This file is the first support file that is loaded by Cucumber when running
# the feature tests. This file contains environmental settings for the
# application under test.
#
# Copyright 2012 Neudesic, LLC
#
###############################################################################

require 'frank-cucumber'

APP_BUNDLE_PATH = "~/Library/Developer/Xcode/DerivedData/Pulse-fdhvznhdimsduaacwltucewbhswo/Build/Products/Debug-iphonesimulator/Pulse Acceptance Tests.app"

APPLICATIONS_DIR = "/Users/#{ENV['USER']}/Library/Application Support/iPhone Simulator/5.1/Applications"
USER_DEFAULTS_PLIST = "Library/Preferences/com.neudesic.Pulse-Acceptance-Tests.dist.plist"

def app_path
  ENV['APP_BUNDLE_PATH'] || (defined?(APP_BUNDLE_PATH) && APP_BUNDLE_PATH)
end

