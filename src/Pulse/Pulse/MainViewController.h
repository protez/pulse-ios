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

/**
 * The MainViewControll class implements the behavior and controls the
 * presentation of the main view for the Pulse client application.
 */
@interface MainViewController : UIViewController

- (SignInViewController *)createSignInViewController;

@end
