//
//  ITSSearchResult+TableViewListControllerItem.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 24/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSSearchResult+TableViewListControllerItem.h"

@implementation ITSSearchResult (TableViewListControllerItem)

- (NSString *)title {
    return self.trackName;
}

- (NSString *)subtitle {
    return self.artistName;
}

- (NSString *)imageName {
    return nil;
}

@end
