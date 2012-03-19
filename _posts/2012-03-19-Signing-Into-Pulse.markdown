---
layout: post
title: Signing Into Pulse
date: 2012-03-19 10:43:00
description: In this post, I start to implement the first user story that will sign the user into Pulse.
---
Crafting the User Story
-----------------------
In my last post, I talked a little bit about how I planned on building my
Pulse client. In this post, I'll walk through and describe the first story
that I'm going to tackle: signing into Pulse. Let us begin this journey by
being faithful software developers and defining the first user story:

<div class="well">
    <p>
        In order to access my feed and post status messages to Pulse<br/>
        As a user<br/>
        I want to sign into Pulse
    </p>
</div>

I am choosing to use the "In order to...As a...I want to..." form for the user
stories. I could easily choose to rewrite the story like this:

<div class="well">
    <p>
        As a user, I want to sign into Pulse in order to access my feed and
        post status messages to Pulse.
    </p>
</div>

I could do that, but I like the first format. It has more value on what the
ultimate value of the story is. The focus isn't really on signing into Pulse,
it's signing into Pulse so that I can access my Pulse feed and post messages
to my co-workers using Pulse.

Now that I have the story down, it's time to define the acceptance criteria for
this story. I'm going to use Frank and Cucumber to document the acceptance
criteria in the form of a feature and scenarios. The feature is the equivalent
of the user story. The scenarios are the acceptance criteria that the
application must satisfy in order for the story to be considered complete.

Here's my Cucumber feature for this first user story:

{% highlight gherkin %}
Feature: Sign Into Pulse
    In order to access my feed and post status messages to Pulse
    As a user
    I want to sign into Pulse

    Scenario: Successfully sign into Pulse
        Given I have not signed into Pulse before
        When I sign into Pulse
        Then I will see my feed

    Scenario: Retrieve password from keychain
        Given I have previously signed into Pulse
        When I start Pulse
        Then I will see my feed

    Scenario: Prompt for password if password changes
        Given I have changed my Pulse password
        When I start Pulse
        Then I will be prompted for my new password

    Scenario: User name is incorrect
        Given I have not signed into Pulse before
        When I sign into Pulse with the wrong user name
        Then I will be told that my login is wrong

    Scenario: Password is incorrect
        Given I have not signed into Pulse before
        When I sign into Pulse with the wrong password
        Then I will be told that my login is wrong
{% endhighlight %}

This is probably a good starting point for the sign-in story. As I develop
the application, or even this story, I may return to the story and add more
acceptance criteria, but I will start with this. Based on the feature, here
are the step definitions that I will start out with:

{% highlight ruby %}
Given /^I have not signed into Pulse before$/ do
  pending
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
{% endhighlight %}

How to Sign Into Pulse
----------------------
Before I dive into building the code, I think that now is a good time to
deviate and understand the actual Pulse operation that this story wraps. As
I wrote earlier, from the iOS platform, a user needs to authenticate with Pulse
using a user name and password. In return, Pulse will send back an access token
that the Pulse client can include in the query string of each request in order
to perform actions in Pulse on behalf of the iPad/iPhone user.

To authenticate the user with Pulse when not using NTLM authentication, the
Pulse client needs to call the Pulse authentication service. For the Neudesic
Pulse implementation, the Pulse authentication service exists at
`https://pulse.neudesic.com/Services/Public/access/authorize`. The authentication
operation accepts an HTTP POST request. The user and client information is
included in the body of the HTTP request and is sent as a JSON object:

{% highlight javascript %}
{
    userName: 'PUT-USER-NAME-HERE',
    password: 'PUT-PASSWORD-HERE',
    clientKey: 'PUT-CLIENT-KEY-HERE',
    clientVersion: 'PUT-CLIENT-VERSION-HERE'
}
{% endhighlight %}

The response from the authorization service is another JSON object that
contains the access token for the user's session:

{% highlight javascript %}
{
    value: 'ACCESS-TOKEN'
}
{% endhighlight %}

There's nothing important to know about the access token. Store it, treat it
as an opaque object, and just pass it to Pulse with each request in the query
string with the name `access_token`.

Now that we understand the authentication web service, we can see that the
ultimate business value of this user story is obtaining the access token that
can be used to unlock all of the other Pulse features for the user.

Test-First Development
----------------------
Earlier in this post I wrote up the Cucumber-based acceptance criteria for
this story and also showed the code for the skeleton step definitions that
will be used to exercise my iOS Pulse client. Thinking about this some more,
since I have already established that I am going to write both an iPhone and
an iPad version of the application, I need to really have two sets of
acceptance tests. The reason is because while I am writing a universal
application that will have a native UI for both the iPhone and iPad, during
automated testing each set of test cases will run in a different version of
the iOS simulator. iPad test cases will need to run against the iPad simulator
and the iPhone test cases will need to run against the iPhone simulator. Also,
because the user interfaces are different, the step implementations may also
be different.

Because I am testing two applications instead of one, does that mean that I
have to have two acceptance test versions of my application (one for iPhone and
one for iPad)? I don't believe so. I think that I can alter the scenarios and
features a little bit to support keeping both in the same test suite. As I dive
into the implementation of the tests and the application, I will look for what
changes that I need to make and will document them in this and later posts.

Now that I have that understanding, I'm going to start to implement the user
story based on the feature definition. I consider myself an optimist, so I'm
going to start with the success scenario first. To refresh your memory, here
is what I am going to implement:

{% highlight gherkin %}
Scenario: Successfully sign into Pulse
  Given I have not signed into Pulse before
  When I sign into Pulse
  Then I will see my feed
{% endhighlight %}

The success scenario states that for a brand-new installation of the Pulse
client on a device where the user has not previously logged into Pulse using
this application, the user will be prompted to enter his user name and password
and, after being authenticated, will be presented with the user's Pulse feed.

Looking at the first step, I need to reset the simulator to its default mode
and make it think that the application was just installed and has never been
used. Since I have not written the application yet, I am not sure what
specifically I need to reset or clear off of the device. To start with, I am
going to use a step posted on the [Frank website](http://www.testingwithfrank.com/user_steps.html)
that will reset the application by deleting any saved preferences. My first
step definition will look like this:

{% highlight ruby %}
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
    if File::Exists?("#{APPLICATIONS_DIR}/#{item}/#{USER_DEFAULTS_PLIST}")
      FileUtils.rm "#{APPLICATIONS_DIR}/#{item}/#{USER_DEFAULTS_PLIST}"
    end
  end
  steps "Given I launch the #{device} application"
end

Given /^I launch the (iphone|ipad) application$/ do |device|
  launch_app app_path, '5.1', device
end
{% endhighlight %}

My scenario first executes the `Given I have not signed into Pulse before`
step. That step will then execute another step that will reset the iPad
application. The reset step will quit the simulator if it is running, look for
and delete any PLIST files containing the preferences for the application,
and will then re-launch the application in the simulator.

I may have to come back to this step to revise it as I build out the rest of
the scenario, but this is an ok place to start and when I run my test, this
first step is green. I'll now look at the actual sign-in process for Pulse.

The next step that I need to implement is `When I sign into Pulse`. This step
will actually lead me into the implementation of Pulse, so I broke quickly to
add [GHUnit](https://github.com/gabriel/gh-unit) to my Xcode project and create
the target for the unit test runner. As I build the code for the application, I
will also write the unit tests for the code and follow the test-driven
development cycle.

To implement this part of the application, I really need to think now about
what I want the application to look like and how I want it to behave for this
feature. To login to Pulse, I need three values from the user:

* The URL of the Pulse server. For me, this will be `https://pulse.neudesic.com`, but for other Pulse customers this will be some other URL.
* The user's login name.
* The user's password.

I think that my design for this feature is that I want the main view (yet to
be decided, but probably will be my Pulse feed) to display. During start up,
the main view will determine if the user credentials are needed, and if so,
will display the sign-in form as a modal popup form. On the iPad, the sign-in
form will be partially overlaid over the main form. On the iPhone, the sign-in
form will be a full-screen modal view.

To complete the automation step, I need to have some sort of user interface to
test against. To do that, I'm jumped into Xcode to write the first half of the
feature which displays the user interface for both the iPad and iPhone. From
there, I can use Frank to help me discover and create the automated tests to
drive the application for the scenario. Here's the user interface for the iPad
and iPhone applications:

<ul class="thumbnails">
    <li class="span3">
        <a href="{{site.url}}/images/2012-03-19-iPad-Sign-In-Form.png" class="thumbnail fancybox" title="Pulse sign-in form on the iPad" data-fancybox-group="signinform">
            <img src="{{site.url}}/images/2012-03-19-iPad-Sign-In-Form-Thumbnail.png" alt="Sign-in form on the iPad"/>
        </a>
        <div class="caption">
            <h5>iPad</h5>
        </div>
    </li>
    <li class="span3">
        <a href="{{site.url}}/images/2012-03-19-iPhone-Sign-In-Form.png" class="thumbnail fancybox" title="Pulse sign-in form on the iPhone" data-fancybox-group="signinform">
            <img src="{{site.url}}/images/2012-03-19-iPhone-Sign-In-Form-Thumbnail.png" alt="Sign-in form on the iPhone"/>
        </a>
        <div class="caption">
            <h5>iPhone</h5>
        </div>
    </li>
</ul>

Given the iPad user interface, I can then implement the `When I sign into Pulse`
step definition like this:

{% highlight ruby %}
When /^I sign into Pulse$/ do
  steps %{
    When I type "https://pulse.neudesic.com" into the "Enter the address of the Pulse server" text field
    When I type "#{ENV['PULSE_USER_NAME']}" into the "Enter your Pulse user name" text field
    When I type "#{ENV['PULSE_PASSWORD']}" into the "Enter your Pulse password" text field
    When I touch "Sign In"
  }
end
{% endhighlight %}

This new step implementation will enter the URL `https://pulse.neudesic.com`
into the **Pulse Address** field. The step will then retrieve the user name and
password to use for the Pulse account from environment variables and will enter
the text into the respective text fields. Because the acceptance tests will use
live accounts for testing against Neudesic's Pulse server, I'm storing the
account information into environment variables that need to be set to run the
acceptance tests, so that security credentials are not included in the source
code, and so that other developers or testers can run the test suite. Finally,
the step will simulate touching the "Sign In" button, which for the moment just
dismisses the modal view but does not actually authenticate the user.

Before getting to the authentication part, I am going to implement the final
step of the scenario first: `Then I will see my feed`. I don't exactly know yet
what "my feed" will look like, so I will implement the test for now as being
satisfied if the sign-in form has been dismissed and is no longer visible:

{% highlight ruby %}
Then /^I will see my feed$/ do
  steps "Then I wait to not see a navigation bar titled \"Sign Into Pulse\""
end
{% endhighlight %}

Now I can run `cucumber` against my feature and the first scenario should come
out green indicating that the scenario is completed and passing. Yes, I know
that I am not yet authenticating the user, but I discoverted that I did not
have to implement that to get the scenario to pass. I will implement the
authentication as part of one of the other scenarios when I will actually
have to validate the user's login with Pulse.