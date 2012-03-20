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
 *
 * @param url The base URL for the Pulse server to connect to.
 * @param userName The login name for the user's Pulse account.
 * @param password The password for the user's Pulse account.
 * @param successHandler A block that will be invoked if the user is successfully
 *      authenticated with Pulse and an access token is returned.
 * @param failureHandler A block that will be invoked if the authentication
 *      fails.
 */
- (void)signIntoPulse:(NSURL *)url withUserName:(NSString *)userName password:(NSString *)password onSuccess:(void (^)())successHandler failure:(void (^)(NSError *))failureHandler;

@end
