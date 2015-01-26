//
//  SRGTimeCheatCapturer.m
//  SRGTimeCheatCapturerDemo
//
//  Created by Kazuhiro Sakamoto on 2015/01/25.
//  Copyright (c) 2015年 Soragoto. All rights reserved.
//

#import "SRGTimeCheatCapturer.h"
#import "ios-ntp.h"
#import "Reachability.h"

@implementation SRGTimeCheatCapturer

- (instancetype) init {
    if( self = [super init] ){
        _allowableDiff = 60.0;
    }
    return self;
}

- (void) checkWithOnCheatCaptured:(SRGTimeCheatCapturerEvent)onCaptured {
    
    if( [self offline] ){
        return;
    }
    
    __weak typeof(self) wself = self;
    
    NetworkClock *clock = [NetworkClock sharedNetworkClock];
    [clock enableAssociations];
    clock.onTimeAcquisitionFinished = ^(NSDate *networkTime){
        NSTimeInterval deviceTime  = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval networkDate = [networkTime timeIntervalSince1970];
        NSTimeInterval diff = abs( deviceTime - networkDate );
        if ( diff > wself.allowableDiff ) {
            onCaptured();
        }
    };
}

- (BOOL) offline {
    Reachability *curReach  = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    return ( netStatus == NotReachable );
}

@end