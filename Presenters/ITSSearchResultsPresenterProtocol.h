//
//  ITSSearchResultsPresenterProtocol.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 24/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITSTableViewListControllerProtocol.h"

@protocol ITSSearchResultsPresenterProtocol <NSObject>

- (void)setController:(id<ITSTableViewListControllerProtocol>)controller;
- (void)performSearchWithTerm:(NSString *)term;

@end
