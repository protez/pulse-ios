/*******************************************************************************
 *
 * main.m
 *
 * This file implements the main program for Pulse on an iOS device.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "PulseApplicationDelegate.h"

/**
 * The main() function implements the main program for the Pulse application.
 * The iOS operating system will invoke this function after the application is
 * loaded and executed. The main() function will use the UIApplicationMain()
 * function to load and run the Pulse client application.
 *
 * @param argc The number of arguments that were passed to the application.
 * @param argv An array of C-style null-terminated strings containing the
 *      arguments that were passed to the application.
 * @return The main() function does not return. The process is moved to the
 *      background by the iOS operating system and eventually is killed.
 */
int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([PulseApplicationDelegate class]));
    }
}
