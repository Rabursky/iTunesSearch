//
//  SearchNetworkMock.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITSSearchNetworkProtocol.h"

@interface SearchNetworkMock : NSObject<ITSSearchNetworkProtocol>

@property (nonatomic) BOOL returnsError;
@property (nonatomic, strong) NSDictionary *returnsJSON;

@end
