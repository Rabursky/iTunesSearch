//
//  InteractorInvoker.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 24/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "InteractorInvoker.h"

@interface InteractorInvoker ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation InteractorInvoker

- (instancetype)init {
    if (self = [super init]) {
        self.queue = [NSOperationQueue new];
    }
    return self;
}

- (void)invoke:(id<ITSInteractorProtocol>)interactor completionBlock:(InteractorInvokerCompletionBlock)completionBlock {
    [self invokeWithBlock:^(NSError *__autoreleasing *error) {
        NSError *localError = [interactor execute];
        *error = localError;
    } completionBlock:completionBlock];
    
}

- (void)invokeWithBlock:(InteractorInvokerCallBlock)callBlock completionBlock:(InteractorInvokerCompletionBlock)completionBlock {
    [self.queue addOperationWithBlock:^{
        NSError *localError;
        callBlock(&localError);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            completionBlock(localError);
        }];
    }];
}

@end
