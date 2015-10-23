//
//  ITSSearchResult.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSSearchResult.h"

@implementation ITSSearchResult

- (BOOL)isEqual:(ITSSearchResult *)object {
    if (![object isKindOfClass:[ITSSearchResult class]]) {
        return NO;
    }
    
    return [self.artistName isEqualToString:object.artistName]
        && [self.trackName isEqualToString:object.trackName]
        && [self.artworkURL isEqual:object.artworkURL]
        && [self.price isEqual:object.price];
// leaving date parsing as of for now
//        && [self.releaseDate isEqual:self.releaseDate];
}

@end
