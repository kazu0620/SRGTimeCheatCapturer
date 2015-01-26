//
//  AppDelegate.m
//  SRGTimeCheatCapturerDemo
//
//  Created by Kazuhiro Sakamoto on 2015/01/25.
//  Copyright (c) 2015年 Soragoto. All rights reserved.
//

#import "AppDelegate.h"
#import "SRGTimeCheatCapturer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    SRGTimeCheatCapturer *capturer = [SRGTimeCheatCapturer new];
    capturer.allowableDiff = 300.0; // default value is 60.0
    __weak typeof(self) wself = self;
    [capturer checkWithOnCheatCaptured:^(){
        [wself showTimeCheatWarning];
    }];
    
}

// Cheat Warning Alert
- (void) showTimeCheatWarning {
     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning" message:@"You are cheating time." preferredStyle:UIAlertControllerStyleAlert];
     [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
         NSURL *url = [NSURL URLWithString:@"itms://itunes.com/apps/"];
         [[UIApplication sharedApplication] openURL:url];
     }]];
     [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}


- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
