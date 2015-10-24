//
//  DetailViewController.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITSSearchResult.h"

@interface ITSTrackDetailViewController : UITableViewController

@property (strong, nonatomic) ITSSearchResult *detailItem;

@end

