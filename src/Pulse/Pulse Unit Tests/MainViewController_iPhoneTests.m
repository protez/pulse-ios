/*******************************************************************************
 *
 * MainViewController_iPhoneTests.m
 *
 * This file implements the MainViewController_iPhoneTests class that unit tests
 * the MainViewController_iPhone class.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "MainViewController_iPhone.h"
#import "SignInViewController.h"

@interface MainViewController_iPhoneTests : GHTestCase
@end

@implementation MainViewController_iPhoneTests

- (void)testCreateSignInViewControllerReturnsModalViewController
{
    MainViewController_iPhone *mainViewController = [[MainViewController_iPhone alloc] init];
    SignInViewController *signInViewController = [mainViewController createSignInViewController];
    GHAssertEqualStrings(@"SignInView_iPhone", signInViewController.nibName, @"The NIB for the view is incorrect.");
    GHAssertEqualStrings(NSLocalizedString(@"Sign In", @"Sign In"), signInViewController.title, @"The title of the SignInViewController is incorrect.");
}

@end
