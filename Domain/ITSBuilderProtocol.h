//
//  ITSBuilderProtocol.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ITSBuilderProtocol <NSObject>

- (NSObject *)buildModelWithJSON:(NSObject *)json;

@end
