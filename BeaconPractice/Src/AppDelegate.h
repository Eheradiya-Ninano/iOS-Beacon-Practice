//
//  AppDelegate.h
//  BeaconPractice
//
//  Created by WooKyun Jeon on 2015. 2. 4..
//  Copyright (c) 2015년 WooKyun Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Reco/Reco.h>

@protocol BeaconDelegate <NSObject>

- (void)enterBeaconRegion:(NSString *)proximityUUID;
- (void)exitBeaconRegion:(NSString *)proximityUUID;

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate, RECOBeaconManagerDelegate> {
    
    RECOBeaconManager *beaconManager;
    NSMutableArray *regionsList;
}

@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) id<BeaconDelegate> beaconDelegate;

- (void)startBackgroundMornitoring:(id<BeaconDelegate>) _beaconDelegate;
- (void)stopBackgroundMornitoring;
    
@end

