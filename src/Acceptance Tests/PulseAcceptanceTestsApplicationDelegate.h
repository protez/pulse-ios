/*******************************************************************************
 *
 * PulseAcceptanceTestsApplicationDelegate.h
 *
 * This file defines the PulseAcceptanceTestsApplicationDelegate class. The
 * PulseAcceptanceTestsApplicationDelegate class extends the
 * PulseApplicationDelegate class to expose an API that can be executed from the
 * acceptance tests to set up specific execution scenarios for acceptance tests.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "PulseApplicationDelegate.h"

/**
 * The PulseAcceptanceTestsApplicationDelegate class extends the
 * PulseApplicationDelegate class in order to expose a public API that can be
 * called from the feature scenarios in order to set up specific conditions for
 * a scenario.
 */
@interface PulseAcceptanceTestsApplicationDelegate : PulseApplicationDelegate
@end
