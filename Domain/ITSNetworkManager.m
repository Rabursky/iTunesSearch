//
//  ITSNetworkManager.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSNetworkManager.h"

@implementation ITSNetworkManager

- (NSDictionary *)getSearchResultsWithTerm:(NSString *)term withError:(NSError **)error {
    NSError *localError = nil;
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@", [term stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet new]]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest new];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSData *data = [self synchronousRequest:request withError:&localError];
    if (localError) {
        *error = localError;
        return nil;
    }
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&localError];
    if (localError) {
        *error = localError;
        return nil;
    }
    
    return json;
}

- (NSData *)synchronousRequest:(NSURLRequest *)request withError:(NSError **)error {
    // Damn Apple, deprecating NSURLConnections' sendSynchronous...
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *returnData;
    __block NSError *returnError;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
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
