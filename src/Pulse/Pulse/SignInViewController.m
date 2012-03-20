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
#import "Pulse.h"

@implementation SignInViewController

@synthesize password;
@synthesize pulse;
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
    [pulse signIntoPulse:[NSURL URLWithString:pulseAddress.text] withUserName:userName.text password:password.text onSuccess:^{
        [self.navigationController dismissModalViewControllerAnimated:YES];        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
