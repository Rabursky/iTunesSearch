//
//  ITSGetSearchResultsInteractor.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSGetSearchResultsInteractor.h"

@interface ITSGetSearchResultsInteractor ()

@property (nonatomic, strong) id<ITSSearchNetworkProtocol> network;
@property (nonatomic, strong) id<ITSBuilderProtocol> builder;

@end

@implementation ITSGetSearchResultsInteractor

- (instancetype)initWithSearchNetwork:(id<ITSSearchNetworkProtocol>)network andSearchResultBuilder:(id<ITSBuilderProtocol>)builder {
    if (self = [super init]) {
        self.network = network;
        self.builder = builder;
    }
    return self;
}

- (NSError *)execute {
    // In more complex situation usage of Gateway/Repository would be recommended
    NSError *localError;
    NSDictionary *data = [self.network getSearchResultsWithTerm:self.input withError:&localError];
    if (localError) {
        return localError;
    }
    
    NSMutableArray *objects = [NSMutableArray new];
    for (NSObject *object in data[@"results"]) {
        id builtObject = [self.builder buildModelWithJSON:object];
        if (builtObject) {
            [objects addObject:builtObject];
        }
    }
    self.output = objects;
    return nil;
}

@end
