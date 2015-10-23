//
//  SearchResultBuilderMock.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "BuilderMock.h"

@implementation BuilderMock

- (NSObject *)buildModelWithJSON:(NSObject *)json {
    return self.returnsObject;
}

@end
