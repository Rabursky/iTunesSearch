//
//  MasterViewController.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSTableViewListController.h"
#import "ITSPresentersFactory.h"
#import "DetailViewController.h"

@interface ITSTableViewListController () <UISearchBarDelegate>

@property (nonatomic, strong) id<ITSSearchResultsPresenterProtocol> presenter;
@property (nonatomic, strong) NSArray<id<ITSTableViewListControllerItemProtocol>> *objects;

@end

@implementation ITSTableViewListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [ITSPresentersFactory searchResultsPresenter];
    [self.presenter setController:self];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
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

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
//        [controller setDetailItem:object];
//        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//        controller.navigationItem.leftItemsSupplementBackButton = YES;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    id<ITSTableViewListControllerItemProtocol> item = self.objects[indexPath.row];
    cell.textLabel.text = item.title;
    return cell;
}

#pragma mark - Search Bar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.presenter performSearchWithTerm:searchBar.text];
}

@end
