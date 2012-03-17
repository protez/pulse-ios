---
layout: post
title: Signing Into Pulse
date: 2012-03-17
description:
published: false
---
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