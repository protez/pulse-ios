/*******************************************************************************
 *
 * Pulse.m
 *
 * This file implements the Pulse class.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "Pulse.h"
#import "Pulse_PrivateImplementation.h"

@implementation Pulse

- (void)signIntoPulse:(NSURL *)url withUserName:(NSString *)userName password:(NSString *)password onSuccess:(void (^)())successHandler failure:(void (^)(NSError *))failureHandler
{
    pulseURL = url;
    NSURL *requestURL = [NSURL URLWithString:@"/Services/Public/access/authorize" relativeToURL:pulseURL];

    NSString *requestMessage = [NSString stringWithFormat:@"{userName:'%@',password:'%@',clientKey:'{2AD95EEC-8AF6-4BAF-835F-DBDC6E626EB7}',clientVersion:'1.0.0.0'}", userName, password];
    
    [self post:requestMessage to:requestURL completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
        if (error)
        {
            failureHandler(error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
        if (jsonError)
        {
            failureHandler(error);
            return;
        }
        
        accessToken = [responseObject objectForKey:@"value"];
        successHandler();
    }];
}

#pragma mark - Private implementation

- (void)post:(NSString *)message to:(NSURL *)url completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))completionHandler
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[message dataUsingEncoding:NSUTF8StringEncoding]];
    [request setAllHTTPHeaderFields:[NSDictionary dictionaryWithObjectsAndKeys:@"application/json", @"Content-Type", @"application/json", @"Accept", nil]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:completionHandler];
}

@end
