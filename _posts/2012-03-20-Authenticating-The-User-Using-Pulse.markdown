---
layout: post
title: Authenticating the User using Pulse
date: 2012-03-20 10:38:00
description: In this post, I go back and revise the code that I implemented in the last post to actually authenticate the user using Pulse and retrieve the user's access token for the Pulse web API.
---
In my last post, I took a shortcut and completed the scenario (as far as the
Cucumber steps were concerned) without actually authenticating the user. Yes,
I cut a corner, but that blog post was over three days in the making while I
tried to figure out Cucumber and Frank, and I just wanted to move onto a new
post. However, I don't like people saying that I cheated, so I'm going to go
back and modify the code to actually sign the user into Pulse. I'm not going
to change the feature or step definitions yet, but I will add onto my unit
test suite and I will show you that code plus the source code for my Pulse
web service client.

To refresh your memory, here's where I left off in my last post. I started off
with the scenario:

{% highlight gherkin %}
Scenario: Successfully sign into Pulse
  Given I have not signed into Pulse before
  When I sign into Pulse
  Then I will see my feed
{% endhighlight %}

To satisfy the story, I built out the sign-in form for the user interface:

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

When I ended the post, clicking the sign-in button simply dismissed the form,
but did not actually authenticate the user using Pulse. I am going to change
this right now. I started off by writing the code to authenticate the user
against Pulse. I created a new Pulse class that implements a sign-in method:

{% highlight objc %}
@interface Pulse : NSObject {
    NSURL *pulseURL;
    NSString *accessToken;
}
- (void)signIntoPulse:(NSURL *)url withUserName:(NSString *)userName password:(NSString *)password onSuccess:(void (^)())successHandler failure:(void (^)(NSError *))failureHandler;
@end
{% endhighlight %}

{% highlight objc %}
- (void)signIntoPulse:(NSURL *)url withUserName:(NSString *)userName password:(NSString *)password onSuccess:(void (^)())successHandler failure:(void (^)(NSError *))failureHandler
{
    pulseURL = url;
    NSURL *requestURL = [NSURL URLWithString:@"/Services/Public/access/authorize" relativeToURL:pulseURL];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
    [request setHTTPMethod:@"POST"];

    NSString *requestMessage = [NSString stringWithFormat:@"{userName:'%@',password:'%@',clientKey:'{2AD95EEC-8AF6-4BAF-835F-DBDC6E626EB7}',clientVersion:'1.0.0.0'}", userName, password];
    NSData *requestData = [requestMessage dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:requestData];

    NSDictionary *requestHeaders = [NSDictionary dictionaryWithObjectsAndKeys:@"application/json", @"Content-Type", @"application/json", @"Accept", nil];
    [request setAllHTTPHeaderFields:requestHeaders];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
        if (error)
        {
            failureHandler(error);
            return;
        }

        NSError *jsonError = nil;
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
        if (jsonError)
        {
            failureHandler(error);
            return;
        }

        accessToken = [responseObject objectForKey:@"value"];
        successHandler();
    }];
}
{% endhighlight %}

The signIntoPulse:withUserName:password:onSuccess:failure: method is called by
the sign-in form to authenticate the user and store the access token for future
requests to the Pulse web API.

<div class="well">
    <h3>An Unexpected Stop for Refactoring</h3>
    <p>
        When I originally wrote the Pulse class, I decided to violate my
        test-driven development rules and not write a unit test for the Pulse
        class. I initially thought that the Pulse class was too low-level to
        unit test and it was going to be hard to isolate the HTTP functionality
        for unit testing. However, as I wrote this blog post and added the
        source code to it, I realized that the signIntoPulse: method would
        actually be easy to create a unit test for.
    </p>
    <p>
        To unit test the Pulse class, I will remove the
        [NSURLConnection sendAsynchronousRequest:queue:completionHandler:]
        method call and will replace it with a call to a private method on the
        Pulse class. Then in my unit tests, I can test using a
        <em>partial mock</em> and mock out the private method.
    </p>
    <p>
        I will start by creating a private category for my Pulse class:
    </p>
{% highlight objc %}
@interface Pulse ()
- (void)post:(NSString *)message to:(NSURL *)url completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))completionHandler;
@end
{% endhighlight %}
    <p>
        Next, I will remove some of the HTTP code from the
        signIntoPulse:userName:password:onSuccess:failure: method and will move
        it into the post:to:completionHandler: method:
    </p>
{% highlight objc %}
- (void)post:(NSString *)message to:(NSURL *)url completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))completionHandler
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[message dataUsingEncoding:NSUTF8StringEncoding]];
    [request setAllHTTPHeaderFields:[NSDictionary dictionaryWithObjectsAndKeys:@"application/json", @"Content-Type", @"application/json", @"Accept", nil]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:completionHandler];
}
{% endhighlight %}
    <p>
        The revised signIntoPulse:withUserName:password:onSuccess:failure:
        method now looks like this:
    </p>
{% highlight objc %}
- (void)signIntoPulse:(NSURL *)url withUserName:(NSString *)userName password:(NSString *)password onSuccess:(void (^)())successHandler failure:(void (^)(NSError *))failureHandler
{
    pulseURL = url;
    NSURL *requestURL = [NSURL URLWithString:@"/Services/Public/access/authorize" relativeToURL:pulseURL];

    NSString *requestMessage = [NSString stringWithFormat:@"{userName:'%@',password:'%@',clientKey:'{2AD95EEC-8AF6-4BAF-835F-DBDC6E626EB7}',clientVersion:'1.0.0.0'}", userName, password];

    [self post:requestMessage to:requestURL completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
        if (error)
        {
            failureHandler(error);
            return;
        }

        NSError *jsonError = nil;
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
        if (jsonError)
        {
            failureHandler(error);
            return;
        }

        accessToken = [responseObject objectForKey:@"value"];
        successHandler();
    }];
}
{% endhighlight %}
    <p>
        The resulting unit test that I created to test the success scenario is
        below:
    </p>
{% highlight objc %}
- (void)testPulseAuthenticationSucceeds
{
    __block void (^completionHandler)(NSURLResponse *, NSData *, NSError *);
    __block BOOL successHandlerCalled = NO;
    __block BOOL failureHandlerCalled = NO;

    Pulse *pulse = [[Pulse alloc] init];

    NSString *expectedMessage = @"{userName:'test.user',password:'test',clientKey:'{2AD95EEC-8AF6-4BAF-835F-DBDC6E626EB7}',clientVersion:'1.0.0.0'}";
    id mockPulse = [OCMockObject partialMockForObject:pulse];
    [[[mockPulse expect] andDo:^(NSInvocation *invocation) {
        id value;
        [invocation getArgument:&value atIndex:4];
        completionHandler = value;
    }] post:expectedMessage to:[OCMArg any] completionHandler:[OCMArg any]];

    [mockPulse signIntoPulse:[NSURL URLWithString:@"https://pulse.neudesic.com"] withUserName:@"test.user" password:@"test" onSuccess:^{
        successHandlerCalled = YES;
    } failure:^(NSError *error) {
        failureHandlerCalled = YES;
    }];

    id mockResponse = [OCMockObject mockForClass:[NSURLResponse class]];
    NSData *data = [@"{\"value\": \"0cc75e88-9bca-4c81-8a0f-9d5ef33c7250\"}" dataUsingEncoding:NSUTF8StringEncoding];
    completionHandler(mockResponse, data, nil);

    [mockPulse verify];
    [mockResponse verify];
    GHAssertTrue(successHandlerCalled, @"The success handler was not called.");
    GHAssertFalse(failureHandlerCalled, @"The failure handler was called.");
}
{% endhighlight%}
    <p>
        Again, I am using GHUnit and OCMock to implement my unit tests. In the
        test, I start by creating a Pulse object, and then I use OCMock to
        create a partial mock over my Pulse object. Using the partial mock, I
        can mock out the post:to:completionHandler: method. In the mock method,
        I store the pointer to the completion handler, because I need to call
        that later in the test method in order to simulate the HTTP request
        completing and sending the response to the completion handler.
    </p>
</div>

With the source code now written to call Pulse in order to authenticate the
user and retrieve the Pulse access token, I can now enhance the action method
that is called when the user touches the "Sign In" button:

{% highlight objc %}
- (IBAction)signIn:(id)sender
{
    [pulse signIntoPulse:[NSURL URLWithString:pulseAddress.text] withUserName:userName.text password:password.text onSuccess:^{
        [self.navigationController dismissModalViewControllerAnimated:YES];
    } failure:^(NSError *error) {
        // TODO: handle error
    }];
}
{% endhighlight %}

In my next post, I will look at enhancing this code to store the user's
password in the iOS keychain so that the user is not required to login each
time the Pulse application is launched.