//
//  DetailViewController.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSTrackDetailViewController.h"
#import "UIImageView+NSURL.h"

@interface ITSTrackDetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *trackNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *releaseDateLabel;

@end

@implementation ITSTrackDetailViewController

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
    }
}

- (void)configureView {
    if (self.detailItem) {
        self.trackNameLabel.text = self.detailItem.trackName;
        self.artistNameLabel.text = self.detailItem.artistName;
        self.priceLabel.text = self.detailItem.price.stringValue;
        self.releaseDateLabel.text = [NSDateFormatter localizedStringFromDate:self.detailItem.releaseDate dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
    }
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.detailItem != nil ? [super tableView:tableView numberOfRowsInSection:section] : 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

@end
