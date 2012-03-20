//
//  Pulse_PrivateImplementation.h
//  Pulse
//
//  Created by Michael Collins on 3/20/12.
//  Copyright (c) 2012 Neudesic, LLC. All rights reserved.
//

#import "Pulse.h"

@interface Pulse ()

- (void)post:(NSString *)message to:(NSURL *)url completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))completionHandler;

@end
