//
//  ITSSearchResultBuilderTestCase.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ITSSearchResultBuilder.h"

@interface ITSSearchResultBuilderTestCase : XCTestCase

@property (nonatomic, strong) ITSSearchResultBuilder *builder;
@property (nonatomic, strong) NSDictionary *correctJSON;

@end

@implementation ITSSearchResultBuilderTestCase

- (void)setUp {
    [super setUp];
    self.builder = [ITSSearchResultBuilder new];
    self.correctJSON = @{
        @"wrapperType": @"track",
        @"kind": @"song",
        @"artistId": @416281071,
        @"collectionId": @416292276,
        @"trackId": @416292278,
        @"artistName": @"Bonobo",
        @"collectionName": @"Black Sands",
        @"trackName": @"Kiara",
        @"collectionCensoredName": @"Black Sands",
        @"trackCensoredName": @"Kiara",
        @"artistViewUrl": @"https://itunes.apple.com/us/artist/bonobo/id416281071?uo=4",
        @"collectionViewUrl": @"https://itunes.apple.com/us/album/kiara/id416292276?i=416292278&uo=4",
        @"trackViewUrl": @"https://itunes.apple.com/us/album/kiara/id416292276?i=416292278&uo=4",
        @"previewUrl": @"http://a1600.phobos.apple.com/us/r30/Music/v4/d5/5a/66/d55a664c-645f-adc9-2f09-4b0fa92044be/mzaf_5713902598585274841.m4a",
        @"artworkUrl30": @"http://is1.mzstatic.com/image/thumb/Music/2d/74/66/mzi.vvxlnswl.jpg/30x30bb-85.jpg",
        @"artworkUrl60": @"http://is3.mzstatic.com/image/thumb/Music/2d/74/66/mzi.vvxlnswl.jpg/60x60bb-85.jpg",
        @"artworkUrl100": @"http://is3.mzstatic.com/image/thumb/Music/2d/74/66/mzi.vvxlnswl.jpg/100x100bb-85.jpg",
        @"collectionPrice": @9.99,
        @"trackPrice": @0.99,
        @"releaseDate": @"2010-03-29T07:00:00Z",
        @"collectionExplicitness": @"notExplicit",
        @"trackExplicitness": @"notExplicit",
        @"discCount": @1,
        @"discNumber": @1,
        @"trackCount": @12,
        @"trackNumber": @2,
        @"trackTimeMillis": @230307,
        @"country": @"USA",
        @"currency": @"USD",
        @"primaryGenreName": @"Electronic",
        @"radioStationUrl": @"https://itunes.apple.com/station/idra.416292278",
        @"isStreamable": @YES
    };
}

- (ITSSearchResult *)resultWithJSON:(NSObject *)json {
    return [self.builder buildModelWithJSON:json];
}

- (void)testBuilderReturnsNilWhenNoJSONProvided {
    XCTAssertNil([self resultWithJSON:nil]);
}

- (void)testBuilderReturnsNilWhenInvalidJSONProvided {
    XCTAssertNil([self resultWithJSON:[NSObject new]]);
    XCTAssertNil([self resultWithJSON:[NSArray new]]);
    XCTAssertNil([self resultWithJSON:@"TEST"]);
    XCTAssertNil([self resultWithJSON:@3]);
}

- (void)testBuilderReturnsInstanceOfSearchResultWhenValidJSONProvided {
    XCTAssert([[self resultWithJSON:@{}] isKindOfClass:[ITSSearchResult class]]);
}

- (void)testBuilderReturnsInstanceOfSearchResultWithFieldsProvidedInValidJSON {
    ITSSearchResult *correctResult = ({
        ITSSearchResult *result = [ITSSearchResult new];
        result.artistName = @"Bonobo";
        result.trackName = @"Kiara";
        result.artworkURL = [NSURL URLWithString:@"http://is3.mzstatic.com/image/thumb/Music/2d/74/66/mzi.vvxlnswl.jpg/100x100bb-85.jpg"];
        result.price = @0.99;
        result;
    });
    XCTAssert([[self resultWithJSON:self.correctJSON] isEqual:correctResult]);
}

@end
