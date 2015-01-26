# SRGTimeCheatCapturer
SRGTimeCheatCapturer validate device time and capture time cheaters by ntp.

##Examples
Open up the AppDelegate.m file and edit applicationDidBecomeActive: to be like so:


```objc
- (void)applicationDidBecomeActive:(UIApplication *)application {

    SRGTimeCheatCapturer *capturer = [SRGTimeCheatCapturer new];
    [capturer checkWithOnCheatCaptured:^(){
    	// Here, you can show warning or impose a penalty if user cheating device time. 
    }];
    
}
```

##Setup Instructions
Install with [CocoaPods](http://cocoapods.org) by adding the following to your Podfile:

``` ruby
pod 'SRGTimeCheatCapturer', '~> 0.0.1'
```
