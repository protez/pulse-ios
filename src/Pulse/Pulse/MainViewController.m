/*******************************************************************************
 *
 * MainViewController.m
 *
 * This file implements the MainViewController class.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "MainViewController.h"
#import "SignInViewController.h"
#import "Pulse.h"

@implementation MainViewController

#pragma mark - View lifecycle events

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pulse = [[Pulse alloc] init];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    SignInViewController *signInViewController = [self createSignInViewController];
    signInViewController.pulse = pulse;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:signInViewController];
    navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:navigationController animated:YES];
}

#pragma mark -

- (SignInViewController *)createSignInViewController
{
    [self doesNotRecognizeSelector:@selector(createSignInViewController)];
    return nil;
}

@end
