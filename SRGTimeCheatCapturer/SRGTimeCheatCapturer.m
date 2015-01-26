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
        _allowableTimeDiff = 50.0;
    }
    return self;
}

- (void) checkWithOnCheatCaptured:(SRGTimeCheatCapturerEvent)onCaptured {
    
    if( [self offline] ){
        return;
    }
    
    NetworkClock *clock = [NetworkClock sharedNetworkClock];
    float allowableDiff = _allowableTimeDiff;
    [clock enableAssociations];
    clock.onTimeAcquisitionFinished = ^(NSDate *networkTime){
        NSTimeInterval deviceTime  = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval networkDate = [networkTime timeIntervalSince1970];
        NSTimeInterval diff = abs( deviceTime - networkDate );
        if ( diff > allowableDiff ) {
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