//
//  NSURLSession+Sync.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 24/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSession (Sync)

- (NSData *)synchronousRequest:(NSURLRequest *)request withError:(NSError **)error;

@end
