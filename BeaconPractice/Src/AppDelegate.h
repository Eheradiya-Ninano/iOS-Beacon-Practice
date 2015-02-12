//
//  AppDelegate.h
//  BeaconPractice
//
//  Created by WooKyun Jeon on 2015. 2. 4..
//  Copyright (c) 2015년 WooKyun Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Reco/Reco.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, RECOBeaconManagerDelegate> {
    
    RECOBeaconManager *beaconManager;
    NSMutableArray *regionsList;
}

@property (strong, nonatomic) UIWindow *window;

- (void)startBackgroundMornitoring;
- (void)stopBackgroundMornitoring;
    
@end

