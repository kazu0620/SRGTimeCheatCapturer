Pod::Spec.new do |s|
  s.name         = "SRGTimeCheatCapturer"
  s.version      = "0.0.1"
  s.summary      = "SRGTimeCheatCapturer can validate device time and capture time cheaters by ntp client."
  s.homepage     = "https://github.com/kazu0620/SRGTimeCheatCapturer"
  s.license      = "MIT"
  s.author       = { "Kazuhiro Sakamoto" => "kazu620@gmail.com" }
  s.source       = { :git => "https://github.com/kazu0620/SRGTimeCheatCapturer.git", :tag => "0.0.1" }
  s.platform     = :ios, '6.0'
  s.source_files = [
      "SRGTimeCheatCapturer/**/*.{h,m}",
      "Library/**/*.{h,m}"
  ]
  s.requires_arc = true
  s.dependency 'Reachability' , '3.2'
  s.prefix_header_contents = <<EOC
#import <Availability.h>
#define NTP_Logging(fmt, ...)
#define LogInProduction(fmt, ...) \
    NSLog((@"%@|" fmt), [NSString stringWithFormat: @"%16s", \
        [[[self class] description] UTF8String]], ##__VA_ARGS__)

#ifdef IOS_NTP_LOGGING
    #warning "IOS_NTP_LOGGING enabled"
    #undef NTP_Logging
    #define NTP_Logging(fmt, ...) \
        NSLog((@"%@|" fmt), [NSString stringWithFormat: @"%16s", \
            [[[self class] description] UTF8String]], ##__VA_ARGS__)
#endif
EOC
end
