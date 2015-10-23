//
//  ITSGetSearchResultsInteractorTestCase.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ITSGetSearchResultsInteractor.h"
#import "SearchNetworkMock.h"
#import "BuilderMock.h"

@interface ITSGetSearchResultsInteractorTestCase : XCTestCase

@property (nonatomic, strong) ITSGetSearchResultsInteractor *interactor;
@property (nonatomic, strong) SearchNetworkMock *network;
@property (nonatomic, strong) BuilderMock *builder;

@end

@implementation ITSGetSearchResultsInteractorTestCase

- (void)setUp {
    [super setUp];
    self.network = [SearchNetworkMock new];
    self.builder = [BuilderMock new];
    self.interactor = [[ITSGetSearchResultsInteractor alloc] initWithSearchNetwork:self.network andSearchResultBuilder:self.builder];
}

- (void)testReturnsErrorWhenNetworkReturnsError {
    self.network.returnsError = YES;
    XCTAssertNotNil([self.interactor execute]);
}

- (void)testOutputIsNilWhenNetworkReturnsError {
    self.network.returnsError = YES;
    [self.interactor execute];
    XCTAssertNil(self.interactor.output);
}

- (void)testReturnsOneObjectForEvery {
    self.builder.returnsObject = [ITSSearchResult new];
    self.network.returnsJSON = @{@"resultCount":@3, @"results": @[@"obj1", @"obj2", @"obj3"]};
    XCTAssertNil([self.interactor execute]);
    XCTAssertNotNil(self.interactor.output);
    XCTAssert(self.interactor.output.count == [self.network.returnsJSON[@"results"] count]);
}


@end
