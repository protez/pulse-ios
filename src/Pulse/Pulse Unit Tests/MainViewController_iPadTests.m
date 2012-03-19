/*******************************************************************************
 *
 * MainViewController_iPadTests.m
 *
 * This file implements the MainViewController_iPadTests class that unit tests
 * the MainViewController_iPad class.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "MainViewController_iPad.h"
#import "SignInViewController.h"

@interface MainViewController_iPadTests : GHTestCase
@end

@implementation MainViewController_iPadTests

- (void)testCreateSignInViewControllerReturnsModalViewController
{
    MainViewController_iPad *mainViewController = [[MainViewController_iPad alloc] init];
    SignInViewController *signInViewController = [mainViewController createSignInViewController];
    GHAssertEqualStrings(@"SignInView_iPad", signInViewController.nibName, @"The NIB for the view is incorrect.");
    GHAssertEqualStrings(NSLocalizedString(@"Sign Into Pulse", @"Sign Into Pulse"), signInViewController.title, @"The title of the SignInViewController object is incorrect.");
}

@end
