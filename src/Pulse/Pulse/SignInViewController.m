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
#import "MBProgressHUD.h"

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
    self.title = NSLocalizedString(@"Sign Into Pulse", @"Sign Into Pulse");
}

#pragma mark - Actions

- (IBAction)signIn:(id)sender
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = NSLocalizedString(@"Signing into Pulse", @"Signing into Pulse");
    [pulse signIntoPulse:[NSURL URLWithString:pulseAddress.text] withUserName:userName.text password:password.text onSuccess:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.navigationController dismissModalViewControllerAnimated:YES];        
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@", error);
    }];
}

@end
