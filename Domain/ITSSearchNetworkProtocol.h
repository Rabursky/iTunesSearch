//
//  ITSSearchNetworkProtocol.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ITSSearchNetworkProtocol <NSObject>

- (NSDictionary *)getSearchResultsWithTerm:(NSString *)term withError:(NSError **)error;

@end
