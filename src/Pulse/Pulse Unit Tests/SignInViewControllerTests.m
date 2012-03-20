/*******************************************************************************
 *
 * SignInViewControllerTests.m
 *
 * This file implements the SignInViewControllerTests class that unit tests the
 * SignInViewController class.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "SignInViewController.h"
#import "Pulse.h"

@interface SignInViewControllerTests : GHTestCase
@end

@implementation SignInViewControllerTests

- (void)testViewDidLoadConfiguresNavigationItem
{
    SignInViewController *signInViewController = [[SignInViewController alloc] init];
    signInViewController.signInButtonItem = [[UIBarButtonItem alloc] init];
    
    [signInViewController viewDidLoad];
    
    GHAssertEqualObjects(signInViewController.signInButtonItem, signInViewController.navigationItem.rightBarButtonItem, @"The right bar button item was not set.");
}

- (void)testSignInDismissesModalView
{
    __block void (^successHandler)();
    id mockPulse = [OCMockObject mockForClass:[Pulse class]];
    [[[mockPulse expect] andDo:^(NSInvocation * invocation) {
        id value;
        [invocation getArgument:&value atIndex:5];
        successHandler = value;
    }] signIntoPulse:[NSURL URLWithString:@"https://pulse.neudesic.com"] withUserName:@"test.user" password:@"test" onSuccess:[OCMArg any] failure:[OCMArg any]];
    
    id mockPulseAddress = [OCMockObject mockForClass:[UITextField class]];
    [[[mockPulseAddress stub] andReturn:@"https://pulse.neudesic.com"] text];
    
    id mockUserName = [OCMockObject mockForClass:[UITextField class]];
    [[[mockUserName stub] andReturn:@"test.user"] text];
    
    id mockPassword = [OCMockObject mockForClass:[UITextField class]];
    [[[mockPassword stub] andReturn:@"test"] text];
    
    SignInViewController *signInViewController = [[SignInViewController alloc] init];
    signInViewController.pulse = mockPulse;
    signInViewController.pulseAddress = mockPulseAddress;
    signInViewController.userName = mockUserName;
    signInViewController.password = mockPassword;
    
    id mockNavigationController = [OCMockObject mockForClass:[UINavigationController class]];
    [[mockNavigationController expect] dismissModalViewControllerAnimated:YES];
    
    id mockSignInViewController = [OCMockObject partialMockForObject:signInViewController];
    [[[mockSignInViewController stub] andReturn:mockNavigationController] navigationController];
    
    id mockBarButtonItem = [OCMockObject mockForClass:[UIBarButtonItem class]];

    [mockSignInViewController signIn:mockBarButtonItem];
    successHandler();
    
    [mockPulse verify];
    [mockSignInViewController verify];
    [mockNavigationController verify];
    [mockBarButtonItem verify];
    [mockPulseAddress verify];
    [mockUserName verify];
    [mockPassword verify];
}

@end
