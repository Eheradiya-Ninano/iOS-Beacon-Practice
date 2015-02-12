//
//  ViewController.h
//  BeaconPractice
//
//  Created by WooKyun Jeon on 2015. 2. 4..
//  Copyright (c) 2015년 WooKyun Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(strong, nonatomic) IBOutlet UIButton *buttonServiceStart;
@property(strong, nonatomic) IBOutlet UIButton *buttonServiceStop;

- (IBAction)clickedServiceStartButton:(id)sender;
- (IBAction)clickedServiceStopButton:(id)sender;

@end

