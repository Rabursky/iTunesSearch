//
//  ITSInteractorsFactory.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSInteractorsFactory.h"
#import "ITSNetworkManager.h"
#import "ITSSearchResultBuilder.h"

@implementation ITSInteractorsFactory

- (ITSGetSearchResultsInteractor *)getSearchResultsInteractor {
    return [[ITSGetSearchResultsInteractor alloc] initWithSearchNetwork:[ITSNetworkManager new] andSearchResultBuilder:[ITSSearchResultBuilder new]];
}

@end
