//
//  ITSGetSearchResultsInteractor.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITSInteractorProtocol.h"
#import "ITSSearchResult.h"
#import "ITSSearchNetworkProtocol.h"
#import "ITSBuilderProtocol.h"

@interface ITSGetSearchResultsInteractor : NSObject <ITSInteractorProtocol>

@property (nonatomic, strong) NSString *input;
@property (nonatomic, strong) NSArray<ITSSearchResult *> *output;

- (instancetype)initWithSearchNetwork:(id<ITSSearchNetworkProtocol>)network andSearchResultBuilder:(id<ITSBuilderProtocol>)builder;

@end
