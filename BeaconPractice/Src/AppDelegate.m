//
//  AppDelegate.m
//  BeaconPractice
//
//  Created by WooKyun Jeon on 2015. 2. 4..
//  Copyright (c) 2015년 WooKyun Jeon. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    beaconManager = [[RECOBeaconManager alloc] init];
    [beaconManager setDelegate:self];
    
    regionsList = [[NSMutableArray alloc] init];
    
//    b0c1861c-b275-11e4-a71e-12e3f512a338  Beacon_Pink
//    b0c188ce-b275-11e4-a71e-12e3f512a338  Beacon_Orange
//    b0c18a18-b275-11e4-a71e-12e3f512a338  Beacon_Green
    NSMutableArray *uuidList = [[NSMutableArray alloc] initWithArray:@[
                                                          [[NSUUID alloc] initWithUUIDString:@"b0c1861c-b275-11e4-a71e-12e3f512a338"],
                                                          [[NSUUID alloc] initWithUUIDString:@"b0c188ce-b275-11e4-a71e-12e3f512a338"],
                                                          [[NSUUID alloc] initWithUUIDString:@"b0c18a18-b275-11e4-a71e-12e3f512a338"]
                                                          ]];
    
    for (int i = 0; i < uuidList.count; i++) {
        NSString *identifier = [[NSString alloc] initWithFormat:@"BEACON_IDENTIFIER_JEREMY_%d", i];
        [self registerBeaconRegionWithUUID:[uuidList objectAtIndex:i] andIdentifier:identifier];
    }
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    [beaconManager requestAlwaysAuthorization];
#endif
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)startBackgroundMornitoring {

    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>>> Start mornitoring <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    for (RECOBeaconRegion *beaconRegion in regionsList) {
        [beaconManager startMonitoringForRegion:beaconRegion];
        [beaconManager startRangingBeaconsInRegion:beaconRegion];
    }
}

- (void)stopBackgroundMornitoring {
    
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>>> Stop mornitoring <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    NSSet *monitoredRegions = [beaconManager getMonitoredRegions];
    for (RECOBeaconRegion *beaconRegion in monitoredRegions) {
        [beaconManager stopMonitoringForRegion:beaconRegion];
        [beaconManager stopRangingBeaconsInRegion:beaconRegion];
    }
}

- (void)registerBeaconRegionWithUUID:(NSUUID *)proximityUUID andIdentifier:(NSString*)identifier {
    
    RECOBeaconRegion *recoRegion = [self getBeaconReginWithUUID:proximityUUID andIdentifier:identifier];
    
    [recoRegion setNotifyOnEntry:YES];
    [recoRegion setNotifyOnExit:YES];
    
    [regionsList addObject:recoRegion];
}

- (RECOBeaconRegion *)getBeaconReginWithUUID:(NSUUID *)proximityUUID
                      andIdentifier:(NSString *)identifier {
    
    // Mornitoring을 위한 RECOBeaconRegion을 정의
    RECOBeaconRegion *recoRegion = [[RECOBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier:identifier];
    [recoRegion setNotifyOnEntry:YES];
    [recoRegion setNotifyOnExit:YES];
    
    return recoRegion;
}

#pragma mark -
#pragma mark RECOBeaconManagerDelegate

- (void)recoManager:(RECOBeaconManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    NSLog(@"AppDelegate >> did change authorization status [status: %d]", status);
}

- (void)recoManager:(RECOBeaconManager *)manager didEnterRegion:(RECOBeaconRegion *)region {
    
    NSLog(@"AppDelegate >> did enter region [manager: %@, region: %@]", manager, region);
}

- (void)recoManager:(RECOBeaconManager *)manager didExitRegion:(RECOBeaconRegion *)region {

    NSLog(@"AppDelegate >> did exit region [manager: %@, region: %@]", manager, region);
}

- (void)recoManager:(RECOBeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(RECOBeaconRegion *)region {
    
    NSLog(@"AppDelegate >> did range beacons in region");
    NSLog(@"AppDelegate >> manager [%@]", [manager description]);
    for (RECOBeacon *beacon in beacons) {
        NSLog(@"AppDelegate >> beacons [proximityUUID: %@, description: %@]", [beacon proximityUUID], [beacon description]);
    }
    NSLog(@"AppDelegate >> region [%@]", [region description]);
}

@end
