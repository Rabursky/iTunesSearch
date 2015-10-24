//
//  ITSSearchResultsPresenter.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITSGetSearchResultsInteractor.h"
#import "ITSSearchResultsPresenterProtocol.h"
#import "InteractorInvokerProtocol.h"

@interface ITSSearchResultsPresenter : NSObject <ITSSearchResultsPresenterProtocol>

@property (nonatomic, weak) id<ITSTableViewListControllerProtocol> controller;

- (instancetype)initWithInteractorInvoker:(id<InteractorInvokerProtocol>)invoker getSearchResultsInteractor:(ITSGetSearchResultsInteractor *)interactor;

@end
