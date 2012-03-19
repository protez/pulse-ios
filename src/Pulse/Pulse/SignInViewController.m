/*******************************************************************************
 *
 * SignInViewController.m
 *
 * This file implements the SignInViewController class.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "SignInViewController.h"

@implementation SignInViewController

@synthesize password;
@synthesize pulseAddress;
@synthesize signInButtonItem;
@synthesize userName;

#pragma mark - View events

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = signInButtonItem;
}

#pragma mark - Actions

- (IBAction)signIn:(id)sender
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

@end
