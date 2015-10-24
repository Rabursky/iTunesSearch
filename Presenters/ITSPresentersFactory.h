//
//  ITSPresentersFactory.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 24/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITSSearchResultsPresenterProtocol.h"

@interface ITSPresentersFactory : NSObject

+ (id<ITSSearchResultsPresenterProtocol>)searchResultsPresenter;

@end
