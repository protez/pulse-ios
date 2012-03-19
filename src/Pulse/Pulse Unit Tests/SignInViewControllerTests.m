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
    SignInViewController *signInViewController = [[SignInViewController alloc] init];
    id mockBarButtonItem = [OCMockObject mockForClass:[UIBarButtonItem class]];
    id mockSignInViewController = [OCMockObject partialMockForObject:signInViewController];
    id mockNavigationController = [OCMockObject mockForClass:[UINavigationController class]];
    [[[mockSignInViewController stub] andReturn:mockNavigationController] navigationController];
    [[mockNavigationController expect] dismissModalViewControllerAnimated:YES];
    
    [mockSignInViewController signIn:mockBarButtonItem];
    
    [mockNavigationController verify];
    [mockBarButtonItem verify];
    [mockSignInViewController verify];
}

@end
