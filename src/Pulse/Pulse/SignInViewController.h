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

/**
 * Gets or sets the UITextField objet that the user will enter his password
 * into.
 */
@property (nonatomic, strong) IBOutlet UITextField *password;

/**
 * Gets or sets the UITextField object that the user will enter the URl of the
 * Pulse server into.
 */
@property (nonatomic, strong) IBOutlet UITextField *pulseAddress;

/**
 * Gets or sets the UIBarButtonItem object that the user will touch to sign the
 * user into Pulse.
 */
@property (nonatomic, strong) IBOutlet UIBarButtonItem *signInButtonItem;

/**
 * Gets or sets the UITextField object that the user will enter his Pulse user
 * name into.
 */
@property (nonatomic, strong) IBOutlet UITextField *userName;

/**
 * Signs the user into Pulse and dismisses the sign-in form.
 *
 * @param sender The UIBarButtonItem object that the user touched to initiate
 *      the action.
 */
- (IBAction)signIn:(id)sender;

@end
