/*******************************************************************************
 *
 * MainViewController_iPad.m
 *
 * This file implements the MainViewController_iPad class.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "MainViewController_iPad.h"
#import "SignInViewController.h"

@implementation MainViewController_iPad

#pragma mark -

- (SignInViewController *)createSignInViewController
{
    SignInViewController *signInViewController = [[SignInViewController alloc] initWithNibName:@"SignInView_iPad" bundle:nil];
    return signInViewController;
}

@end
