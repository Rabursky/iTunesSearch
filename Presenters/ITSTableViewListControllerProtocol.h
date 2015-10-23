//
//  ITSTableViewListControllerProtocol.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITSTableViewListControllerItemProtocol.h"

@protocol ITSTableViewListControllerProtocol <NSObject>

- (void)showLoadingIndication;
- (void)hideLoadingIndication;

- (void)displayError:(NSError *)error;
- (void)displayListWithItems:(NSArray<id<ITSTableViewListControllerItemProtocol>> *)items;

@end
