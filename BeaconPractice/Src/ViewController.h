//
//  ViewController.h
//  BeaconPractice
//
//  Created by WooKyun Jeon on 2015. 2. 4..
//  Copyright (c) 2015년 WooKyun Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController <BeaconDelegate>

@property(strong, nonatomic) IBOutlet UIButton *buttonServiceStart;
@property(strong, nonatomic) IBOutlet UIButton *buttonServiceStop;

@property(strong, nonatomic) IBOutlet UILabel *labelOrangeBeacon;
@property(strong, nonatomic) IBOutlet UILabel *labelGreenBeacon;
@property(strong, nonatomic) IBOutlet UILabel *labelPinkBeacon;

- (IBAction)clickedServiceStartButton:(id)sender;
- (IBAction)clickedServiceStopButton:(id)sender;

@end

