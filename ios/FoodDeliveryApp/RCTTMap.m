//
//  RCTTMap.m
//  FoodDeliveryApp
//
//  Created by 서성경 on 2022/09/22.
//

#import <Foundation/Foundation.h>
#import "RCTTMap.h"
#import "TMapTapi.h"

@implementation RCTTMap
- (instancetype)init
{
    // 모듈이 로딩될 때 실행되는 부분
    self = [super init];
    [TMapTapi setSKTMapAuthenticationWithDelegate:self apiKey:@"l7xxd59c4c8e72d242a383826479622e6d7b"];
    return self;
}
- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE(TMap);

RCT_EXPORT_METHOD(openNavi: (NSString *)name longitude:(NSString *)longitude latitude:(NSString *)latitude vehicle:(NSString *)vehicle resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    NSLog(@"y,x %@, %@", latitude, longitude);
    BOOL installed = [TMapTapi isTmapApplicationInstalled];
    if (installed) {
        CLLocationCoordinate2D centerCoordinate = {[latitude doubleValue], [longitude doubleValue]};
        BOOL flag = [TMapTapi invokeRoute:name coordinate: centerCoordinate];
        NSLog(flag ? @"Yes" : @"No");
        if (flag) {
            resolve(@(YES));
        } else {
            resolve(@(NO));
        }
    } else {
        resolve(@(NO));
    }
}

@end
