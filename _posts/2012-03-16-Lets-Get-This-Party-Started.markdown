---
layout: post
title: Let's Get This Party Started!
date: 2012-03-16 20:20:00
description: In this post, I introduce the Pulse for iOS project and talk about some of the goals that I hope to achieve. I discuss the approach that I will take to developing the application and some of my reasoning for choosing that approach.
---
Looking at my checklist, I can check off creating the GitHub project. Now I
need to move onto step #2: creating some code to put in said GitHub project.
This is where the heard work really begins. At this point, I have a very vague
idea of what I want to accomplish. I know that I want to build a Pulse client
for my iPad, and I know the kinds of things that I do on Pulse on a regular
basis.

The first task that I need to accomplish before I can call the Pulse API web
services is to authenticate the user against Pulse. If I were developing a
Windows application, I could choose to let the .NET HTTP library take care
of the NTLM integration with Pulse, but since I am developing an iOS
application, I have to choose another option. Fortunately, the Pulse API
provides me with an option. I can start off by calling an API operation to
obtain an access token based on the user name and password of the Pulse user.
Once I have this access token, I can pass the access token to the other Pulse
API operations on behalf of the user.

Since I'm thinking about authentication, the next thing that comes to mind is
that I don't want to have to keep logging into Pulse every time that I start
the application. I would like to use the keychain functionality of the iOS
operating system to store the password for me between sessions. When the Pulse
client starts a new session, I will reload the password from the keychain and
then re-authenticate against Pulse for the session.

For this project, I have decided that I am going to implement both an iPad and
an iPhone version of the Pulse client. I am going to implement the iPhone
version because I want to compare the experiences of building an iPad
application versus the iPhone application. I will document the design decisions
that I make between the full-sized user interface for the iPad, and how the
limitations of the iPhone interface and size affect the design of the iPhone
user interface. I will be developing the application as a universal application
so that the user interface looks native to the iPad on an iPad device and to
the iPhone on an iPhone device.

As for the general development approach, I am going to try to "behave" and
"build the application the right way." What I mean by that is that I will try
to adhere as much as possible to a test-driven development approach. There are
two reasons for this. First, it's probably good to have a test suite. Second,
while I have written and published a few applications to the Apple AppStore
now, I still have a lot to learn about Objective-C and iOS development. I'm
hoping that having a good test suite will keep me honest and teach me some
new techniques for developing professional iPhone and iPad applications. For
the unit test framework, I will be using the
[GHUnit](https://github.com/gabriel/gh-unit) library. I've tried using the
built-in unit test framework that comes with Xcode, but I really like the
user interface and overall implementation of GHUnit.

I will also try to adhere to Robert Martin's
[Three Laws of Test-Driven Development](http://butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd):

> 1. You are not allowed to write any production code unless it is to make a failing unit test pass.
> 2. You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are failures.
> 3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

What this basically means is that I will be bouncing back and forth between
unit tests and the main code, and hopefully I can keep all of those jumps
documented in these blog posts as I write the application.

To take this approach to testing a step further, I'm going to try to implement
a fully automated acceptance test suite using [Cucumber](http://cukes.info/)
and [Frank](http://www.testingwithfrank.com/). Cucumber and Frank are
Ruby-based tools for creating acceptance or story tests. Cucumber provides
the framework for writing and executing the tests. Frank extends Cucumber to
provide UI automation of iOS applications. I have never used either tool on a
project, so I am interested to see how I can utilize them for creating
a real software product.

In my next post, I will get started by building out the user authentication
story. I will present the story, scenarios, test code, and actual program
code.