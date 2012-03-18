/*******************************************************************************
 *
 * PulseApplicationDelegate.h
 *
 * This file defines the PulseApplicationDelegate class. A
 * PulseApplicationDelegate object is used as the delegate for the UIApplication
 * object that runs the Pulse client application. The PulseApplicationDelegate
 * object will manage the global state for the application and will handle
 * application-level events.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

/**
 * The PulseApplicationDelegate class implements the delegate object for the
 * UIApplication object that runs the Pulse client on an iOS device. The
 * PulseApplicationDelegate object will manage the global state for the
 * application and will handle application-level events.
 */
@interface PulseApplicationDelegate : UIResponder <UIApplicationDelegate>

/**
 * Gets or sets the main window for the Pulse application.
 */
@property (strong, nonatomic) UIWindow *window;

@end
