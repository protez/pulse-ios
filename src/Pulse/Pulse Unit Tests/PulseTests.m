/*******************************************************************************
 *
 * PulseTests.m
 *
 * This file implements the PulseTests class that unit tests the Pulse class.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "Pulse.h"
#import "Pulse_PrivateImplementation.h"

@interface PulseTests : GHTestCase
@end

@implementation PulseTests

- (void)testPulseAuthenticationSucceeds
{
    __block void (^completionHandler)(NSURLResponse *, NSData *, NSError *);
    __block BOOL successHandlerCalled = NO;
    __block BOOL failureHandlerCalled = NO;
    
    Pulse *pulse = [[Pulse alloc] init];
    
    NSString *expectedMessage = @"{userName:'test.user',password:'test',clientKey:'{2AD95EEC-8AF6-4BAF-835F-DBDC6E626EB7}',clientVersion:'1.0.0.0'}";
    id mockPulse = [OCMockObject partialMockForObject:pulse];
    [[[mockPulse expect] andDo:^(NSInvocation *invocation) {
        id value;
        [invocation getArgument:&value atIndex:4];
        completionHandler = value;
    }] post:expectedMessage to:[OCMArg any] completionHandler:[OCMArg any]];
    
    [mockPulse signIntoPulse:[NSURL URLWithString:@"https://pulse.neudesic.com"] withUserName:@"test.user" password:@"test" onSuccess:^{
        successHandlerCalled = YES;
    } failure:^(NSError *error) {
        failureHandlerCalled = YES;
    }];
    
    id mockResponse = [OCMockObject mockForClass:[NSURLResponse class]];
    NSData *data = [@"{\"value\": \"0cc75e88-9bca-4c81-8a0f-9d5ef33c7250\"}" dataUsingEncoding:NSUTF8StringEncoding];
    completionHandler(mockResponse, data, nil);
    
    [mockPulse verify];
    [mockResponse verify];
    GHAssertTrue(successHandlerCalled, @"The success handler was not called.");
    GHAssertFalse(failureHandlerCalled, @"The failure handler was called.");
}

@end
