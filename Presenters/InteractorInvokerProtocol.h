//
//  InteractorInvokerProtocol.h
//  iTunesSearch
//
//  Created by Marcin Rabursky on 24/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITSInteractorProtocol.h"

typedef void (^InteractorInvokerCompletionBlock)(NSError *error);
typedef void (^InteractorInvokerCallBlock)(NSError **error);

@protocol InteractorInvokerProtocol <NSObject>

- (void)invoke:(id<ITSInteractorProtocol>)interactor completionBlock:(InteractorInvokerCompletionBlock)completionBlock;
- (void)invokeWithBlock:(InteractorInvokerCallBlock)callBlock completionBlock:(InteractorInvokerCompletionBlock)completionBlock;


@end
