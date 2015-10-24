//
//  ITSNetworkManager.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSNetworkManager.h"
#import "NSURLSession+Sync.h"

@implementation ITSNetworkManager

- (NSDictionary *)getSearchResultsWithTerm:(NSString *)term withError:(NSError **)error {
    NSError *localError = nil;
    NSString *searchTerm = term ? [term stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet new]] : @"";
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@", searchTerm];
    
    NSMutableURLRequest *request = [NSMutableURLRequest new];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSData *data = [[NSURLSession sharedSession] synchronousRequest:request withError:&localError];
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

@end
