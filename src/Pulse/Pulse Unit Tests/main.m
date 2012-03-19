/*******************************************************************************
 *
 * main.m
 *
 * This file implements the main program for the Pulse client unit test suite.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

/**
 * The main() function implements the Pulse client unit test suite. The main()
 * function will use the UIApplicationMain() function to launch the user
 * interface for the unit test suite.
 *
 * @param argc The number of arguments that were passed to the application.
 * @param argv An array of C-style null-terminated strings containing the
 *      arguments that were passed to the application.
 * @return The main() function does not return. When the program ends, the iOS
 *      operating system will move the program into the background.
 */
int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, @"GHUnitIOSAppDelegate");
    }
}
