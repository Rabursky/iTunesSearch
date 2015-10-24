//
//  ITSArtworkTableViewCell+NSURL.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 24/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "UIImageView+NSURL.h"
#import "NSURLSession+Sync.h"

@implementation UIImageView (NSURL)

- (void)loadImageWithURL:(NSURL *)url {
    // Cache layer could have been added here
    // Background queue could have been shared / static
    dispatch_queue_t backgroundQueue = dispatch_queue_create("artworkLoadingQueue", NULL);
    dispatch_async(backgroundQueue, ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *localError;
        NSData *data = [[NSURLSession sharedSession] synchronousRequest:request withError:&localError];
        if (!localError) {
            UIImage *image = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = image;
            });
        }
    });
}

@end
