//
//  ITSPresentersFactory.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 24/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSPresentersFactory.h"
#import "ITSSearchResultsPresenter.h"
#import "ITSInteractorsFactory.h"

@implementation ITSPresentersFactory

+ (id<ITSSearchResultsPresenterProtocol>)searchResultsPresenter {
    return [[ITSSearchResultsPresenter alloc] initWithGetSearchResultsInteractor:[ITSInteractorsFactory getSearchResultsInteractor]];
}

@end
