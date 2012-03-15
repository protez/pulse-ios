Pulse for iPhone and iPad Documentation
---------------------------------------
The **gh-pages** branch contains the source code for the GitHub Pages website
for the [Pulse for iPhone and iPad](http://github.com/mfcollins3/pulse-ios)
project. The GitHub Pages website is used to publish technical documentation
and status information about the development and evolution of the iPhone and
iPad application for accessing
[Neudesic](http://www.neudesic.com)'s [Pulse](http://www.neudesic.com/what/products/pulse/Pages/index.aspx)
product.

As stated on the project site, this project is an **unofficial** hobby
project. The goals of the project are:

1. Learn how to program against the Pulse API
2. Experiment with ideas for developing an iOS application around Pulse
3. Serve as an example to other Pulse users how the Pulse API can be used to integrate with Pulse

For more information about the project, please read the
[README.md](https://github.com/mfcollins3/pulse-ios/blob/master/README.md) file
in the master branch of the GitHub repository.

Building the GitHub Pages Website
---------------------------------
In order to build and host the website in a local web server, you will need to
install the following software:

* [Ruby](http://www.ruby-lang.org) 1.9.3
* [Rake](http://rake.rubyforge.org/)
* [Jekyll](http://jekyllrb.com/)
* [Node.js](http://nodejs.org) 0.6.12
* [LESS](http://lesscss.org) 1.3.0

This project uses Ruby Rake to automate the build process for the GitHub Pages
website. In order to build the website, execute the following command in a
Terminal shell:

    $ rake

To run the website locally on your development machine, you can then use Jekyll
to create a local webserver:

    $ jekyll --server

Once the web server is running, you should be able to view the technical
documentation on the website by browsing to http://localhost:4000.

The following public build tasks have been defined in **Rakefile**:

<table>
  <tr>
    <th>Task</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>clean</strong></td>
    <td>Removes all build-generated intermediate files from the project workspace.</td>
  </tr>
  <tr>
    <td><Strong>clobber</strong></td>
    <td>Removes all build-generated files and products from the project workspace.</td>
  </tr>
  <tr>
    <td><strong>default</strong></td>
    <td>
      Builds the project GitHub Pages website. This is the default task and will
      execute automatically if no other tasks are specified.
    </td>
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