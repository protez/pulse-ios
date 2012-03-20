/*******************************************************************************
 *
 * Pulse.h
 *
 * This file implements the Pulse class that wraps the Pulse web API to allow
 * the application to interact with a Pulse server.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

/**
 * Client gateway class that wraps the Pulse web API.
 *
 * The application will use a Pulse object to interact with a Pulse server. The
 * Pulse class exposes methods that wrap the web API operations exposed by a
 * Pulse server.
 */
@interface Pulse : NSObject {
    NSURL *pulseURL;
    NSString *accessToken;
}

/**
 * Signs the user into Pulse and retrieves the user's authentication token.
 *
 * The signIntoPulse:withUserName:password:onSuccess:failure: method executes
 * asynchronously. To blocks are passed to the method that will be called
 * whether the operation succeeds or fails.
 */
- (void)signIntoPulse:(NSURL *)url withUserName:(NSString *)userName password:(NSString *)password onSuccess:(void (^)())successHandler failure:(void (^)(NSError *))failureHandler;

@end
