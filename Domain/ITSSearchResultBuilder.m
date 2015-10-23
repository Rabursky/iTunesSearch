//
//  ITSSearchResultBuilder.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSSearchResultBuilder.h"

@implementation ITSSearchResultBuilder

- (ITSSearchResult *)buildModelWithJSON:(NSDictionary *)json {
    if (![json isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    // I am totally ommiting here the difference between result kinds and wrapperTypes
    ITSSearchResult *result = [ITSSearchResult new];
    result.artistName = json[@"artistName"];
    result.trackName = json[@"trackName"];
    result.artworkURL = json[@"artworkUrl100"] ? [NSURL URLWithString:json[@"artworkUrl100"]] : nil;
    result.price = json[@"trackPrice"];
    return result;
}

@end
