//
//  MasterViewController.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSTableViewListController.h"
#import "ITSPresentersFactory.h"
#import "ITSTrackDetailViewController.h"
#import "ITSArtworkTableViewCell.h"
#import "UIImageView+NSURL.h"
#import "ITSTrackDetailViewController.h"

@interface ITSTableViewListController () <UISearchBarDelegate>

@property (nonatomic, strong) id<ITSSearchResultsPresenterProtocol> presenter;
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSArray<ITSSearchResult *> *objects;

@end

@implementation ITSTableViewListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [ITSPresentersFactory searchResultsPresenter];
    [self.presenter setController:self];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.searchBar.text.length == 0) {
        [self.searchBar becomeFirstResponder];
    }
}

#pragma mark - ITSTableViewListControllerProtocol

- (void)showLoadingIndication {
    self.tableView.tableFooterView = ({
        UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        view.frame = CGRectMake(0, 0, 100, 100);
        [view startAnimating];
        view;
    });
}

- (void)hideLoadingIndication {
    self.tableView.tableFooterView = nil;
}

- (void)displayError:(NSError *)error {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:error.domain message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)displayListWithItems:(NSArray *)items {
    self.objects = items;
    [self.tableView reloadData];
}

#pragma mark - Auxiliary

- (void)updateDetailWithItem:(ITSSearchResult *)item {
    UIViewController *controller = [[self.splitViewController.viewControllers lastObject] topViewController];
    if ([controller isKindOfClass:[ITSTrackDetailViewController class]]) {
        ((ITSTrackDetailViewController *)controller).detailItem = item;
    } else {
        [self performSegueWithIdentifier:@"showDetail" sender:item];
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        ITSTrackDetailViewController *controller = (ITSTrackDetailViewController *)[segue destinationViewController];
        [controller setDetailItem:sender];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ITSArtworkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    ITSSearchResult *item = self.objects[indexPath.row];
    cell.titleLabel.text = item.trackName;
    cell.subtitleLabel.text = item.artistName;
    cell.artworkImageView.image = nil;
    [cell.artworkImageView loadImageWithURL:item.artworkURL];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ITSSearchResult *item = self.objects[indexPath.row];
    [self updateDetailWithItem:item];
}

#pragma mark - Search Bar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self.presenter performSearchWithTerm:searchBar.text];
}

@end
