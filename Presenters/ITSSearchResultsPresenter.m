//
//  ITSSearchResultsPresenter.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSSearchResultsPresenter.h"
#import "ITSSearchResult+TableViewListControllerItem.h"

@interface ITSSearchResultsPresenter ()

@property (nonatomic, strong) ITSGetSearchResultsInteractor *interactor;

@end

@implementation ITSSearchResultsPresenter

- (instancetype)initWithGetSearchResultsInteractor:(ITSGetSearchResultsInteractor *)interactor {
    if (self = [super init]) {
        self.interactor = interactor;
    }
    return self;
}

- (void)performSearchWithTerm:(NSString *)term {
    [self.controller displayListWithItems:@[]];
    [self.controller showLoadingIndication];
    self.interactor.input = term;
    [self.interactor execute];
    [self.controller hideLoadingIndication];
    [self.controller displayListWithItems:self.interactor.output];
}

@end
