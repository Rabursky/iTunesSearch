//
//  ITSSearchResultsPresenter.m
//  iTunesSearch
//
//  Created by Marcin Rabursky on 23/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

#import "ITSSearchResultsPresenter.h"

@interface ITSSearchResultsPresenter ()

@property (nonatomic, strong) ITSGetSearchResultsInteractor *interactor;
@property (nonatomic, strong) id<InteractorInvokerProtocol> invoker;

@end

@implementation ITSSearchResultsPresenter

- (instancetype)initWithInteractorInvoker:(id<InteractorInvokerProtocol>)invoker getSearchResultsInteractor:(ITSGetSearchResultsInteractor *)interactor {
    if (self = [super init]) {
        self.invoker = invoker;
        self.interactor = interactor;
    }
    return self;
}

- (void)performSearchWithTerm:(NSString *)term {
    [self.controller displayListWithItems:@[]];
    [self.controller showLoadingIndication];
    
    NSString *input = term;
    __weak ITSSearchResultsPresenter *weakSelf = self;
    
    self.interactor.input = term;
    [self.invoker invoke:self.interactor completionBlock:^(NSError *error) {
        if ([weakSelf isMostRecentSearch:input]) {
            [self.controller hideLoadingIndication];
            if (error) {
                [self.controller displayError:error];
            } else {
                [self.controller displayListWithItems:self.interactor.output];
            }
        }
    }];
}

- (BOOL)isMostRecentSearch:(NSString *)term {
    return [self.interactor.input isEqualToString:term];
}

@end
