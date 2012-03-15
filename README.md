Pulse for iPhone and iPad
=========================
The goal of this project is to design and construct an **unofficial** client
for [Neudesic](http://www.neudesic.com)'s [Pulse](http://www.neudesic.com/what/products/pulse/Pages/index.aspx)
product. The application that is being built here is **unofficial**
because it is a hobby project that is being used to serve three purposes:

1. Learn how to program against the Pulse API
2. Experiment with ideas for developing an iOS application around Pulse
3. Serve as an example to other Pulse users how the Pulse API can be used to integrate with Pulse

As a Neudesic employee, Pulse is a product that I use quite frequently in my
daily job and activities, both from contributing to pulse as well as receiving
news about my job or collaborating with my teammates. Besides the learning
aspect of this project, I also hope to build a tool with the features that I
think will be helpful in allowing me to use Pulse more effectively.

For more information about this project, please check out the project's
GitHub Pages website at http://mfcollins3.github.com/pulse-ios.

About Pulse
-----------
Pulse is an enterprise social platform built by Neudesic, LLC, for companies
to use to facilitate collaboration amongst the enterprise. Originally inspired
by the momentum of sites like Facebook and Twitter, among others, Pulse allows
the sharing of information amongst employees and also facilitates communication
between team members more effectively than email. Pulse is a living, breathing
system for sharing and collaboration.

Building Pulse for iPhone and iPad
----------------------------------
Pulse for iPhone and iPad is designed for the iOS 5.1 operating system. You
will need the following installed to develop or build this application:

* [Xcode](http://itunes.apple.com/us/app/xcode/id497799835?mt=12) 4.3.1
* [iOS SDK](http://developer.apple.com) 5.1
* [Ruby](http://www.ruby-lang.org) 1.9.3
* [Rake](http://rake.rubyforge.org/)
* [Cucumber](http://cukes.info/)
* [Node.js](http://nodejs.org) 0.6.12
* [LESS](http://lesscss.org) 1.3.0
* [appledoc](http://gentlebytes.com/appledoc/)

This project uses Ruby Rake to automate the build and packaging process, or
to run the acceptance tests for the project. In order to build the application,
execute the following command in a Terminal shell:

    $ rake

The following public build tasks have been defined:

<table>
  <tr>
    <th>Task</th>
    <th>Description></th>
  </tr>
  <tr>
    <td><strong>clean</strong></td>
    <td>Removes all build-generated intermediate files from the project workspace.</td>
  </tr>
  <tr>
    <td><strong>clobber</strong></td>
    <td>Removes all build-generated files and products from the project workspace.</td>
  </tr>
  <tr>
    <td><strong>default</strong></td>
    <td>
      Builds the Pulse application. This is the default target and will execute
      automatically if no other tasks are specified.
    </td>
  </tr>
  <tr>
    <td><strong>test</strong></td>
    <td>Builds the acceptance test version of Pulse and executes the acceptance test suite.</td>
  </tr>
</table>

GitHub Pages Website
--------------------
This project has a corresponding GitHub Pages website located at
http://mfcollins3.github.com/pulse-ios. The source code for the GitHub Pages
website can be found by checking out the **gh-pages** branch.

There are parts of the master branch that update the GitHub Pages website,
for example to publish the acceptance test results or the appledoc-generated
API documentation. It is recommended that you set up your environment in the
following way:

    $ mkdir pulse-ios
    $ cd pulse-ios
    $ git clone github-url master
    $ git clone master gh-pages
    $ cd gh-pages
    $ git gh-pages

The parts of the build process that update the GitHub Pages website will refer
to the GitHub Pages website using the relative path *../gh-pages*. Please see
the **README.md** file in the **gh-pages** branch for instructions about how
to build and host the GitHub Pages website locally for you to reference while
working with the project's source code.

Contact Information
-------------------
The contact information for the project team members is below. Please feel free
to reach out with any questions or ideas that you may have.

<table>
  <tr>
    <th>Contributor</th>
    <th>Blog</th>
    <th>Email</th>
    <th>Twitter</th>
  </tr>
  <tr>
    <td><strong>Michael Collins</strong></td>
    <td>
      <ul>
        <li><a href="http://mfcollins3.github.com">http://mfcollins3.github.com</a></li>
        <li><a href="http://www.michaelfcollins3.me">http://www.michaelfcollins3.me</a></li>
        <li><a href="http://blogs.neudesic.com">http://blogs.neudesic.com</a></li>
      </ul>
    </td>
    <td><a href="mailto:michael.collins@neudesic.com">michael.collins@neudesic.com</a></td>
    <td><a href="http://twitter.com/mfcollins3">@mfcollins3</a></td>
  </tr>
</table>

License
-------
Copyright &copy; 2012 Neudesic, LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE