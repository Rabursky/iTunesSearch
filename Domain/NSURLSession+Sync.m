//
//  NSURLSession+Sync.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 24/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "NSURLSession+Sync.h"

@implementation NSURLSession (Sync)

- (NSData *)synchronousRequest:(NSURLRequest *)request withError:(NSError **)error {
    // Damn Apple, deprecating NSURLConnections' sendSynchronous...
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *returnData;
    __block NSError *returnError;
    
    [[self dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        returnError = error;
        returnData = data;
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    if (returnError) {
        *error = returnError;
        return nil;
    }
    
    return returnData;
}

@end
