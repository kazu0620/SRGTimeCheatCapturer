//
//  SRGTimeCheatCapturer.h
//  SRGTimeCheatCapturerDemo
//
//  Created by Kazuhiro Sakamoto on 2015/01/25.
//  Copyright (c) 2015年 Soragoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRGTimeCheatCapturer : NSObject

typedef void (^SRGTimeCheatCapturerEvent)();

@property float allowableTimeDiff;

- (void) checkWithOnCheatCaptured:(SRGTimeCheatCapturerEvent)onCaptured;

@end
