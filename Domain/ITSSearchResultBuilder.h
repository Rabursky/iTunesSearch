//
//  ITSSearchResultBuilder.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITSBuilderProtocol.h"
#import "ITSSearchResult.h"

@interface ITSSearchResultBuilder : NSObject <ITSBuilderProtocol>

- (ITSSearchResult *)buildModelWithJSON:(NSObject *)json;

@end
