/*******************************************************************************
 *
 * SignInViewController.h
 *
 * This file defines the SignInViewController class. The SignInViewController
 * class implements the behavior of the sign-in modal view that the user will
 * enter his user name and password into for authentication.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

/**
 * The SignInViewController class controls the sign-in view that the user will
 * enter his user name and password into for authenticating with the Pulse
 * server.
 */
@interface SignInViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *password;
@property (nonatomic, strong) IBOutlet UITextField *pulseAddress;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *signInButtonItem;
@property (nonatomic, strong) IBOutlet UITextField *userName;

- (IBAction)signIn:(id)sender;

@end
