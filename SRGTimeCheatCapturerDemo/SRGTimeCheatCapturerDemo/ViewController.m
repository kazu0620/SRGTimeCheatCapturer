//
//  ViewController.m
//  SRGTimeCheatCapturerDemo
//
//  Created by Kazuhiro Sakamoto on 2015/01/25.
//  Copyright (c) 2015年 Soragoto. All rights reserved.
//

#import "ViewController.h"
#import "SRGTimeCheatCapturer.h"
#import "ios-ntp.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SRGTimeCheatCapturer *capturer = [SRGTimeCheatCapturer new];
    capturer.allowableDiff = 1.0;
    [capturer checkWithOnCheatCaptured:^(){
        NSLog(@"CHEAT CAMPTURED!!");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
