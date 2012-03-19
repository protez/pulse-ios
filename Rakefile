###############################################################################
#
# Rakefile
#
# This script automates the process of building the GitHub Pages website for
# the Pulse client for iPhone and iPad devices.
#
# Copyright 2012 Neudesic, LLC
#
###############################################################################

require 'rake/clean'

CLEAN.include('./build')

CLOBBER.include('./_site')

STYLESHEET_FILES = FileList.new('./src/stylesheets/normal.less')
CSS_FILES = STYLESHEET_FILES.pathmap('%{^./src/stylesheets,./css}X.css')
CSS_IMAGE_FILES = FileList.new('./lib/twitter-bootstrap/img/*.png')
CSS_IMAGE_FILES.include('./lib/fancybox/**/*.gif')
CSS_IMAGE_FILES.include('./lib/fancybox/**/*.png')

JS_FILES = FileList.new('./lib/jQuery/jquery.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-modal.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-dropdown.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-scrollspy.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-tab.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-tooltip.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-popover.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-alert.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-button.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-collapse.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-carousel.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-typeahead.js')
JS_FILES.include('./lib/twitter-bootstrap/js/bootstrap-transition.js')
JS_FILES.include('./lib/jquery-mousewheel/jquery.mousewheel.js')
JS_FILES.include('./lib/fancybox/source/jquery.fancybox.js')
JS_FILES.include('./lib/fancybox/source/helpers/jquery.fancybox-buttons.js')
JS_FILES.include('./lib/fancybox/source/helpers/jquery.fancybox-thumbs.js')

desc 'Builds the GitHub Pages website'
task :default => [:compile_stylesheets, :compile_javascript] do
  sh "jekyll --pygments --safe"
end

task :compile_javascript => ['./js', './js/website.js']

task :compile_stylesheets => ['./build', './css/images'] + CSS_FILES + CSS_IMAGE_FILES

directory './build'

directory './css/images'

directory './js'

file './js/website.js' => ['./js'] + JS_FILES do
  sh "java -jar ./lib/closurecompiler/compiler.jar --js #{JS_FILES.join(' --js ')} > ./js/website.js"
end

rule(/\.css$/ => [proc {|t| t.pathmap('%{^./css,./src/stylesheets}X.less')}]) do |t|
  tempCssName = t.name.pathmap('./build/%f')
  sh "lessc #{t.source} > #{tempCssName}"
  sh "java -jar ./lib/yuicompressor/build/yuicompressor-2.4.8pre.jar --type css -o #{t.name} #{tempCssName}"
end

CSS_IMAGE_FILES.each do |source|
  cp source, source.pathmap('./css/images/%f')
end
