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
#import "InteractorInvoker.h"

@implementation ITSPresentersFactory

+ (id<ITSSearchResultsPresenterProtocol>)searchResultsPresenter {
    return [[ITSSearchResultsPresenter alloc] initWithInteractorInvoker:[InteractorInvoker new] getSearchResultsInteractor:[ITSInteractorsFactory getSearchResultsInteractor]];
}

@end
