//
//  SearchNetworkMock.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "SearchNetworkMock.h"

@implementation SearchNetworkMock

- (NSDictionary *)getSearchResultsWithTerm:(NSString *)term withError:(NSError **)error {
    if (self.returnsError) {
        *error = [NSError errorWithDomain:@"test" code:0 userInfo:nil];
    }
    return self.returnsJSON;
}

@end
