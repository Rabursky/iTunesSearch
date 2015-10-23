//
//  ITSSearchResult.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITSSearchResult : NSObject

@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *trackName;
@property (nonatomic, strong) NSURL *artworkURL;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSDate *releaseDate;

@end
