/*******************************************************************************
 *
 * MainViewController.h
 *
 * This file defines the MainViewController class. The MainViewController class
 * implements the behavior for the main view of the Pulse client that is
 * displayed when the Pulse client starts.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

@class SignInViewController;
@class Pulse;

/**
 * The MainViewController class implements the behavior and controls the
 * presentation of the main view for the Pulse client application.
 */
@interface MainViewController : UIViewController {
    Pulse *pulse;
}

/**
 * Creates the SignInViewController object to use to sign the user into Pulse.
 *
 * The createSignInViewController method is overriden by derived classes to
 * create and configure the SignInViewController object for the specific device
 * that the application is running on.
 *
 * @return Returns a SignInViewController object.
 */
- (SignInViewController *)createSignInViewController;

@end
