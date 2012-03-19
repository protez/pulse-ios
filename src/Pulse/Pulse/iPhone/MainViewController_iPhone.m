/*******************************************************************************
 *
 * MainViewController_iPhone.m
 *
 * This file implements the MainViewController_iPhone class that extends the
 * MainViewController class to implement the iPhone-specific view.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "MainViewController_iPhone.h"
#import "SignInViewController.h"

@implementation MainViewController_iPhone

#pragma mark -

- (SignInViewController *)createSignInViewController
{
    SignInViewController *viewController = [[SignInViewController alloc] initWithNibName:@"SignInView_iPhone" bundle:nil];
    viewController.title = NSLocalizedString(@"Sign In", @"Sign In");
    return viewController;
}

@end
