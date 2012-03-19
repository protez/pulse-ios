###############################################################################
#
# Rakefile
#
# This script automates the process of building and packaging the Pulse for
# iOS application for deployment to the Apple App Store or for Ad Hoc
# deployments.
#
# Copyright 2012 Neudesic, LLC
#
###############################################################################

desc 'Builds the Pulse for iOS application'
task :default => [:generate_appledoc_documentation]

desc 'Runs the acceptance test suite'
task :test do
  sh "cucumber Frank"
end

task :generate_appledoc_documentation do
  sh "appledoc --project-name \"Pulse for iOS\" --project-company \"Neudesic, LLC\" --company-id com.neudesic --output ../gh-pages/api --no-create-docset --ignore .m ./src/Pulse/Pulse"
end